import 'package:ecom_store/features/authentication/screens/password_config/reset_password.dart';
import 'package:ecom_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(ecomSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Headings
            Text("Forgot Password",
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: ecomSizes.spaceBtwnItems),
            Text(
                "Dont worry! We got you... Just Enter your email in the textbox and we will send you a reset link",
                style: Theme.of(context).textTheme.labelLarge),
            const SizedBox(height: ecomSizes.spaceBtwnSections * 2),

            ///Text field
            TextFormField(
              decoration: const InputDecoration(
                  labelText: "Email", prefixIcon: Icon(Iconsax.direct_right)),
            ),
            
            const SizedBox(height: ecomSizes.spaceBtwnSections),

            ///Submit Button
            SizedBox(width: double.infinity, height: 50, child: ElevatedButton(onPressed: () => Get.to(() => const ResetPassword()), child: const Text('Submit'))),
          ],
        ),
      ),
    );
  }
}
