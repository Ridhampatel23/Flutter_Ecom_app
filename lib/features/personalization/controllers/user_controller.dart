import 'package:ecom_store/data/repositories/user/user_repository.dart';
import 'package:ecom_store/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../authentication/controllers/signup/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoader = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());


  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  /// Save User Record for any Registration Provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        // Convert Name to First and Last Name
        final nameParts =
            UserModel.nameParts(userCredentials.user?.displayName ?? "User");
        final userName =
            UserModel.generateUserName(userCredentials.user!.displayName ?? "");

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
    } catch (e) {
      ecomLoaders.warningSnackBar(
          title: "Data Not Saved",
          message:
              "Something went wrong while saving you information. You can re-save your data in your profile.");
    }
  }

  ///Fetch User Record
  Future<void> fetchUserRecord() async {
    try{
      profileLoader.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoader.value = false;
    }

  }
}
