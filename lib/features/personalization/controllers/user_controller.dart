import 'package:ecom_store/data/repositories/authentication/authentication_repository.dart';
import 'package:ecom_store/data/repositories/user/user_repository.dart';
import 'package:ecom_store/utils/helpers/network_manager.dart';
import 'package:ecom_store/features/authentication/screens/login/login.dart';
import 'package:ecom_store/features/personalization/screens/profile/widget/re_authenticate_user_login_form.dart';
import 'package:ecom_store/utils/constants/images_strings.dart';
import 'package:ecom_store/utils/constants/sizes.dart';
import 'package:ecom_store/utils/popups/full_screen_loader.dart';
import 'package:ecom_store/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../authentication/controllers/signup/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoader = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final hidePassword = false.obs;
  final imageUploading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  /// Save User Record for any Registration Provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      // First update the Rx user and then check if user data is already stored. If not, store the new data
      await fetchUserRecord();

      // If no record already stored
      if (user.value.id.isEmpty) {
        if (userCredentials != null) {
          // Convert Name to First and Last Name
          final nameParts =
              UserModel.nameParts(userCredentials.user?.displayName ?? "User");
          final userName = UserModel.generateUserName(
              userCredentials.user!.displayName ?? "");

          // Map Data
          final user = UserModel(
              id: userCredentials.user!.uid,
              userName: userName,
              email: userCredentials.user?.email ?? "unknown@example.com",
              firstName: nameParts.isNotEmpty ? nameParts[0] : "User",
              lastName:
                  nameParts.length > 1 ? nameParts.sublist(1).join(" ") : "",
              phoneNumber: userCredentials.user!.phoneNumber ?? "",
              profilePicture: userCredentials.user!.photoURL ?? "");

          // Save User Data
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      ecomLoaders.warningSnackBar(
          title: "Data Not Saved",
          message:
              "Something went wrong while saving you information. You can re-save your data in your profile.");
    }
  }

  ///Fetch User Record
  Future<void> fetchUserRecord() async {
    try {
      profileLoader.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoader.value = false;
    }
  }

  /// Delete Account Warning
  void deleteAccountWarningPopUp() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(ecomSizes.medium),
      title: "Delete Account",
      middleText:
          "Are you sure you want to delete this account permanently? This action is not reversible and all of your data will be removed permanently.",
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            side: const BorderSide(color: Colors.red)),
        child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: ecomSizes.large),
            child: Text("Delete")),
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: const Text("Cancel"),
      ),
    );
  }

  void deleteUserAccount() async {
    try {
      ecomFullScreenLoader.openLoadingDialogue(
          "Processing", ecomImages.decoderAnimation);

      /// First re-authenticate user
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        // Re Verify Auth Email
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          ecomFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          ecomFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthenticateUserLoginForm());
        }
      }
    } catch (e) {
      ecomFullScreenLoader.stopLoading();
      ecomLoaders.warningSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  /// Re Authenticate before deleting
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      ecomFullScreenLoader.openLoadingDialogue(
          "Processing", ecomImages.decoderAnimation);

      // Check Internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        ecomFullScreenLoader.stopLoading();
        return;
      }

      if (!reAuthFormKey.currentState!.validate()) {
        ecomFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
              verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      ecomFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      ecomFullScreenLoader.stopLoading();
      ecomLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  /// Upload Profile Image
  uploadUserProfilePicture() async {
    try {
    // We use await as it might take a long time for user to pick an image to upload
    final image = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 70, maxHeight: 512, maxWidth: 512);
    if (image != null){
      imageUploading.value = true;
      // Upload Image
      final imageUrl = await userRepository.uploadImage('Users/Images/Profile/', image);

      // Update User Image Record
      Map<String, dynamic> json = {'ProfilePicture' : imageUrl};
      await userRepository.updateSpecificField(json);

      user.value.profilePicture = imageUrl;
      user.refresh();

      ecomLoaders.successSnackBar(title: 'Congratulations!', message: "Your Profile Image has been updated");
    }} catch (e) {
      ecomLoaders.errorSnackBar(title: "Oh Snap!", message: "Something went wrong : $e");
    } finally{
      imageUploading.value= false;
    }
  }
}
