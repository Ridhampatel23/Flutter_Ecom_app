import 'package:ecom_store/data/repositories/authentication/authentication_repository.dart';
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
  final lastName = TextEditingController();//Controller for last name input
  final firstName = TextEditingController();//Controller for first name input
  final userName = TextEditingController();//Controller for user name input
  final phoneNumber = TextEditingController();//Controller for phone number input
  final password = TextEditingController();//Controller for password input
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>(); // Form Key for form validation

  /// -- Signup
  Future<void> signup() async {

    try {
      //Start Loading
      ecomFullScreenLoader.openLoadingDialogue("We are processing your information...", ecomImages.decoderAnimation );

      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }

      // Form Validation
      if(!signupFormKey.currentState!.validate()){
        return;
      }
      // Privacy Policy Check
      if(!privacyPolicy.value){
        ecomLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message: 'In order to create an account, you must read and accept the Privacy Policy and Terms of Use.',
        );
        return;
      }
       // Register the user in the Firebase Authentication and Save user data in the Firebase
        await AuthenticationRepository.instace.registerWithEmailandPassword(email.text.trim(), password.text.trim());

    } catch (e){
      // Show some generic error to the user
      ecomLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // Remove Loader
      ecomFullScreenLoader.stopLoading();
    }

  }

}