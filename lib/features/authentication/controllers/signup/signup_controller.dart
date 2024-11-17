import 'package:ecom_store/utils/constants/images_strings.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../../utils/popups/fullscreen_loader.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final email = TextEditingController(); //Controller for email input
  final lastName = TextEditingController();//Controller for last name input
  final firstName = TextEditingController();//Controller for first name input
  final userName = TextEditingController();//Controller for user name input
  final phoneNumber = TextEditingController();//Controller for phone number input
  final passWord = TextEditingController();//Controller for password input
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>(); // Form Key for form validation

  /// -- Signup
  Future<void> signup() async {

    try {
      //Start Loading
      ecomFullScreenLoader.openLoadingDialogue("We are processing your information...", ecomImages.decoderAnimation );

      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();

    } catch (e){

    }

  }

}