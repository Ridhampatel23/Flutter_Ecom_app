

import 'package:ecom_store/features/authentication/screens/login/login.dart';
import 'package:ecom_store/features/authentication/screens/onboarding/onboarding.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instace => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  final _auth  = FirebaseAuth.instance;

  /// Called from main.dart on app launch

  @override
  void onReady(){
    FlutterNativeSplash.remove();
    screenRedirect();
  }



  /// Function to show Relevant Screen
  screenRedirect() async {
    // local storage
    deviceStorage.writeIfNull("isFirstTime", true);

    // Check if it's the first time for the user launching the app
    deviceStorage.read("isFirstTime") != true ? Get.offAll(() => const LoginScreen()) : Get.offAll(const OnBoardingScreen());
  }


 /* ------------------------ Email and Password sign-in ------------------*/

  /// [EmailAuthentication] Sign In
  /// [EmailAuthentication] Register
  Future<UserCredential>  registerWithEmailandPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw ecomFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw ecomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const ecomFormatException();
    } on PlatformException catch (e) {
      throw ecomPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  /// [EmailAuthentication] Sign In




}