
import 'package:ecom_store/data/repositories/authentication/authentication_repository.dart';
import 'package:ecom_store/features/authentication/controllers/signup/network_manager.dart';
import 'package:ecom_store/features/authentication/screens/password_config/reset_password.dart';
import 'package:ecom_store/utils/constants/images_strings.dart';
import 'package:ecom_store/utils/popups/full_screen_loader.dart';
import 'package:ecom_store/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController{
  static ForgotPasswordController get instance => Get.find();

  /// Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();

  /// Send Password Reset Email
  sendPasswordResetEmail() async {
    try {
      // Start Loading
      ecomFullScreenLoader.openLoadingDialogue("Processing the request...", ecomImages.decoderAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        ecomFullScreenLoader.stopLoading(); return;
      }

      // Form Validation
      if (!forgotPasswordFormKey.currentState!.validate()) {
        ecomFullScreenLoader.stopLoading();
        return;
      }
      // Send the Password Reset Email
      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      //Remove the Loader once the main action has been committed
      ecomFullScreenLoader.stopLoading();

      ecomLoaders.successSnackBar(title: "Email Sent!", message: "Email Link Sent to Reset your Password".tr);

      // Redirect
      Get.to(() => ResetPassword(email: email.text.trim()));
      
    } catch (e) {
      // Remove Loader
      ecomFullScreenLoader.stopLoading();
      ecomLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      // Start Loading
      ecomFullScreenLoader.openLoadingDialogue("Processing the request...", ecomImages.decoderAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        ecomFullScreenLoader.stopLoading(); return;
      }

      // Send the Password Reset Email
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      //Remove the Loader once the main action has been committed
      ecomFullScreenLoader.stopLoading();

      ecomLoaders.successSnackBar(title: "Email Sent!", message: "Email Link Sent to Reset your Password".tr);


    } catch (e) {
      // Remove Loader
      ecomFullScreenLoader.stopLoading();
      ecomLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }
}
