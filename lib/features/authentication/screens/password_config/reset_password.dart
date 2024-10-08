import 'package:ecom_store/features/authentication/screens/login/login.dart';
import 'package:ecom_store/utils/constants/images_strings.dart';
import 'package:ecom_store/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/helpers/helper_functions.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.offAll(const LoginScreen()), icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ecomSizes.defaultSpace),
          child: Column(
            children: [
              ///Image or Animation
              Image(
                image:  const AssetImage(ecomImages.EmailLogo),
                width: ecomHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: ecomSizes.spaceBtwnSections),
        
              ///Title and SubTitle
              Text("A Password Reset Link has been sent to your Email",
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: ecomSizes.spaceBtwnItems),
              Text( "Your Account Security is Our Top Priority! We've sent You a Secure Link to Safely Change Your Password and Keep Your Account Protected",
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: ecomSizes.spaceBtwnSections),
        
              ///Button
              SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: (){},
                      child: const Text("Done"))),
              const SizedBox(height: ecomSizes.spaceBtwnItems),
              SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: TextButton(
                      onPressed: (){},
                      child: const Text("Resend Email"))),


            ],
          ),
        ),
      ),
    );
  }
}
