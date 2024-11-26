import 'package:ecom_store/data/repositories/authentication/authentication_repository.dart';
import 'package:ecom_store/features/authentication/controllers/signup/network_manager.dart';
import 'package:ecom_store/utils/constants/images_strings.dart';
import 'package:ecom_store/utils/popups/full_screen_loader.dart';
import 'package:ecom_store/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController{

  /// Variables
  // Again, we use obs because setState redraws the entire screen on being toggled
  // while obs only redraws the widget.
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

 // Press Ctrl + O to find methods to override
  @override
  void onInit() {
    email.text = localStorage.read("REMEMBER_ME_EMAIL") ?? "";
    password.text = localStorage.read("REMEMBER_ME_PASSWORD") ?? "";
    super.onInit();
  }

  /// - Email and Password LogIn
  Future<void> emailAndPasswordLogIn() async {
    try {
      // Start Loading
      ecomFullScreenLoader.openLoadingDialogue(
          "Logging you in...", ecomImages.decoderAnimation);

      //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        ecomFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        ecomFullScreenLoader.stopLoading();
        return;
      }

      // Save DAta if Remember Me is selected
      if (rememberMe.value) {
        // local storage write function always need a JSON format (key - value pair)
        localStorage.write("REMEMBER_ME_EMAIL", email.text.trim());
        localStorage.write("REMEMBER_ME_PASSWORD", password.text.trim());
      }

      // Login after using Email and Password Authentication
      final userCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Remove Loader
      ecomFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      ecomFullScreenLoader.stopLoading();
      ecomLoaders.errorSnackBar(title: "Oh Snap", message: e.toString());

      }

    }
  }
