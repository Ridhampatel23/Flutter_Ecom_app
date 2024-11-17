

import 'package:ecom_store/features/authentication/screens/login/login.dart';
import 'package:ecom_store/features/authentication/screens/onboarding/onboarding.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instace => Get.find();

  /// Variables
  final deviceStorage = GetStorage();

  /// Called from main.dart on app launch

  @override
  void onReady(){
    FlutterNativeSplash.remove();
    screenRedirect();
  }



  /// Function to show Relevant Screen
  screenRedirect() async {
    if (kDebugMode) {
      print("=========================== GET STORAGE ===============");
      print(deviceStorage.read('isFirstTime'));
    }
    // local storage
    deviceStorage.writeIfNull("isFirstTime", true);
    deviceStorage.read("isFirstTime") != true ? Get.offAll(() => const LoginScreen()) : Get.offAll(const OnBoardingScreen());
  }


 /* ------------------------ Email and Password sign-in ------------------*/






}