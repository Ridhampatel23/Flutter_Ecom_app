import 'package:ecom_store/features/authentication/screens/login/login.dart';
import 'package:ecom_store/features/authentication/screens/onboarding/onboarding.dart';
import 'package:ecom_store/features/authentication/screens/singup/verify_email.dart';
import 'package:ecom_store/navigation_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;


  /// Get Authenticated User Data
  User? get authUser => _auth.currentUser;

  /// Called from main.dart on app launch

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// Function to show Relevant Screen
  screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      // local storage
      deviceStorage.writeIfNull("isFirstTime", true);

      // Check if it's the first time for the user launching the app
      deviceStorage.read("isFirstTime") != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(const OnBoardingScreen());
    }
  }

  /* ------------------------ Email and Password sign-in ------------------*/

  /// [EmailAuthentication] Log In
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
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

  /// [EmailAuthentication] Register
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
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

  /// [EmailVerification] - Mail Verification
  Future<void> sendEmailVerification() async {
    try {
      return await _auth.currentUser?.sendEmailVerification();
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

  /// [EmailVerification] - Forgot Password
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
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


  /// [GoogleAuthentication] - Google

  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the Authentication popUp
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      //Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;

      // Create new Account Credentials
      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the userCredentials
      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      throw ecomFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw ecomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const ecomFormatException();
    } on PlatformException catch (e) {
      throw ecomPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) {
        print('Something went wrong: $e');
        return null;
      }
    }
  }

  // TODO: Implement Facebook SignIn

  /* ---------------------- ./ end Federated Identity and social sign - in -------------------*/

  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
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
}
