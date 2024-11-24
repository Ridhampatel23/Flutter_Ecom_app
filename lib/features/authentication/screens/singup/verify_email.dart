import 'package:ecom_store/common/widgets/success_screen/success_screen.dart';
import 'package:ecom_store/data/repositories/authentication/authentication_repository.dart';
import 'package:ecom_store/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:ecom_store/features/authentication/screens/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/images_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String ? email;

  @override
  Widget build(BuildContext context) {
    //Get.put creates and instance while Get.find finds the current instance, since
    // we want to send a verification email, we create a new instance
    final controller = Get.put(VerifyEmailController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: //Actions always start from the right side of the screen
            [
          IconButton(
              onPressed: () => AuthenticationRepository.instance.logout(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ecomSizes.defaultSpace),
          child: Column(
            children: [
              ///Image
              Image(
                image: const AssetImage(ecomImages.EmailLogo),
                width: ecomHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: ecomSizes.spaceBtwnSections),

              ///Title and SubTitle
              Text('Verify Your Email Address! ',
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: ecomSizes.spaceBtwnItems),
              Text(email ?? "",
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center),
              const SizedBox(height: ecomSizes.spaceBtwnItems),
              Text(
                  "Congratulations! Your Account Awaits: Verify Your Email to Start Shopping and Experience a World of Unrivaled Deals and Personalized Offers.",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: ecomSizes.spaceBtwnSections),

              ///Buttons\
              SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => controller.checkEmailVerificationStatus(),
                      child: const Text("Continue"))),
              const SizedBox(height: ecomSizes.spaceBtwnItems),
              SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () => controller.sendEmailVerification(), child: const Text("Resend Email"))),
            ],
          ),
        ),
      ),
    );
  }
}
