import 'package:ecom_store/features/authentication/controllers/forgot_password/forgot_password_controller.dart';
import 'package:ecom_store/utils/constants/sizes.dart';
import 'package:ecom_store/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPasswordController());
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
            Form(
              key: controller.forgotPasswordFormKey,
              child: TextFormField(
                controller: controller.email,
                validator: ecomValidator.validateEmail,
                decoration: const InputDecoration(
                    labelText: "Email", prefixIcon: Icon(Iconsax.direct_right)),
              ),
            ),
            
            const SizedBox(height: ecomSizes.spaceBtwnSections),

            ///Submit Button
            SizedBox(width: double.infinity, height: 50, child: ElevatedButton(onPressed: () => controller.sendPasswordResetEmail(), child: const Text('Submit'))),
          ],
        ),
      ),
    );
  }
}
