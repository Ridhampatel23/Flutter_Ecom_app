import 'package:ecom_store/data/repositories/authentication/authentication_repository.dart';
import 'package:ecom_store/data/repositories/user/user_repository.dart';
import 'package:ecom_store/features/authentication/controllers/signup/network_manager.dart';
import 'package:ecom_store/features/personalization/controllers/user_controller.dart';
import 'package:ecom_store/features/personalization/screens/profile/profile.dart';
import 'package:ecom_store/utils/constants/images_strings.dart';
import 'package:ecom_store/utils/popups/full_screen_loader.dart';
import 'package:ecom_store/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      // Start Loading
      ecomFullScreenLoader.openLoadingDialogue(
          "We are Updating your information", ecomImages.decoderAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        ecomFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        ecomFullScreenLoader.stopLoading();
        return;
      }

      // Update user's first and last name in the Firestore
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim()
      };
      await userRepository.updateSpecificField(name);

      // Update the Rx User Value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      // Remove Loader
      ecomFullScreenLoader.stopLoading();

      // Show Success Message
      ecomLoaders.successSnackBar(
          title: "Congratulations", message: "Your Name has been Updated!");

      // Move to Previous Screen
      Get.off(() => const ProfileScreen());
    } catch (e) {
      ecomFullScreenLoader.stopLoading();
      ecomLoaders.errorSnackBar(title: "Oh Snap", message: e.toString());
    }
  }
}
