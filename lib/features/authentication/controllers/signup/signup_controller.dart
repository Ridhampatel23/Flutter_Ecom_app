import 'package:ecom_store/data/repositories/authentication/authentication_repository.dart';
import 'package:ecom_store/data/repositories/user/user_repository.dart';
import 'package:ecom_store/features/authentication/controllers/signup/user_model.dart';
import 'package:ecom_store/features/authentication/screens/singup/verify_email.dart';
import 'package:ecom_store/utils/constants/images_strings.dart';
import 'package:ecom_store/utils/popups/loaders.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../../utils/popups/full_screen_loader.dart';
import 'network_manager.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final privacyPolicy = false.obs;
  final hidePassword = true.obs; //Observable for Hiding / Showing Password
  final email = TextEditingController(); //Controller for email input
  final lastName = TextEditingController(); //Controller for last name input
  final firstName = TextEditingController(); //Controller for first name input
  final userName = TextEditingController(); //Controller for user name input
  final phoneNumber =
      TextEditingController(); //Controller for phone number input
  final password = TextEditingController(); //Controller for password input
  GlobalKey<FormState> signupFormKey =
      GlobalKey<FormState>(); // Form Key for form validation

  /// -- Signup
  Future<void> signup() async {
    try {
      //Start Loading
      ecomFullScreenLoader.openLoadingDialogue(
          "We are processing your information...", ecomImages.decoderAnimation);

      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        ecomFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!signupFormKey.currentState!.validate()) {
        // Remove Loader
        ecomFullScreenLoader.stopLoading();
        return;
      }
      // Privacy Policy Check
      if (!privacyPolicy.value) {
        ecomLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message:
              'In order to create an account, you must read and accept the Privacy Policy and Terms of Use.',
        );
        ecomFullScreenLoader.stopLoading();
        return;
      }
      // Register the userCredentials in the Firebase Authentication and Save userCredentials data in the Firebase
      final userCredentials = await AuthenticationRepository.instace.registerWithEmailandPassword(
          email.text.trim(), password.text.trim());

      // Save Authenticated userCredentials data in the Firebase Firestore
      final newUser = UserModel(
          id: userCredentials.user!.uid,
          userName: userName.text.trim(),
          email: email.text.trim(),
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: '');

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Remove Loader
      ecomFullScreenLoader.stopLoading();

      // Show Success Message
      ecomLoaders.successSnackBar(title: "Congratulations", message: "Your Account has been created! Verify email to continue.");

      //Verify Email Screen
      Get.to(()=> const VerifyEmailScreen());

    } catch (e) {


      // Remove Loader
      ecomFullScreenLoader.stopLoading();

      // Show some generic error to the userCredentials
      ecomLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
