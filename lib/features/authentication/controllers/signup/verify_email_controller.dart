import 'dart:async';
import 'package:ecom_store/common/widgets/success_screen/success_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/images_strings.dart';
import '../../../../utils/popups/loaders.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  Timer? _timer; // Store the timer instance

  /// Send Email Whenever Verify Email Screen appears and Set timer for auto redirect.
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  @override
  void onClose() {
    _timer?.cancel(); // Cancel timer when the controller is disposed
    super.onClose();
  }

  /// Send Email Verification Link
  Future<void> sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      ecomLoaders.successSnackBar(
        title: "Email Sent",
        message: "Please check your email inbox and verify your email.",
      );
    } catch (e) {
      ecomLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  /// Timer to automatically redirect on Email Verification
  void setTimerForAutoRedirect() {
    _timer = Timer.periodic(
      const Duration(seconds: 3), // Check every 3 seconds
          (timer) async {
        try {
          await FirebaseAuth.instance.currentUser?.reload(); // Reload user state
          final user = FirebaseAuth.instance.currentUser;

          if (user?.emailVerified ?? false) {
            timer.cancel(); // Cancel the timer
            _navigateToSuccessScreen(); // Navigate to success screen
          }
        } catch (e) {
          timer.cancel(); // Stop timer if there's an error
          ecomLoaders.errorSnackBar(title: "Error", message: e.toString());
        }
      },
    );
  }

  /// Manually Check if Email Verified
  Future<void> checkEmailVerificationStatus() async {
    try {
      await FirebaseAuth.instance.currentUser?.reload();
      final currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null && currentUser.emailVerified) {
        _navigateToSuccessScreen();
      } else {
        ecomLoaders.warningSnackBar(
          title: "Not Verified",
          message: "Your email is not verified yet. Please try again.",
        );
      }
    } catch (e) {
      ecomLoaders.errorSnackBar(title: "Error", message: e.toString());
    }
  }

  /// Navigate to Success Screen
  void _navigateToSuccessScreen() {
    Get.off(
          () => SuccessScreen(
        image: ecomImages.AccountCreated,
        title: 'Your Account Has Been Created!',
        subTitle:
        "Welcome to your Ultimate Shopping Destination. Your Account is Created. Unleash the Joy of Seamless Online Shopping",
        onPressed: () =>
            AuthenticationRepository.instance.screenRedirect(),
      ),
    );
  }
}
