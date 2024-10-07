import 'package:ecom_store/features/authentication/screens/singup/widgets/singup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';

class ecomLoginForm extends StatelessWidget {
  const ecomLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: ecomSizes.spaceBtwnSections),
        child: Column(
          children: [
            ///Email
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: "Email"),
            ),
            const SizedBox(height: ecomSizes.spaceBtwnInputFields),

            ///Password
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: "Password",
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: SizedBox(
                  height: ecomSizes.spaceBtwnInputFields / 2),
            ),

            ///Remember Me and Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///Remember Me
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (vaue) {}),
                    const Text('Remember Me'),
                  ],
                ),

                ///Forget Password
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Forgot Password?",
                  ),
                ),
              ],
            ),
            const SizedBox(height: ecomSizes.spaceBtwnSections),

            ///Sign In Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0), // Uniform padding
                ),
                child: const Text("Sign In"),
              ),
            ),

            const SizedBox(height: ecomSizes.spaceBtwnItems),

            ///Create Account Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const signupScreen()),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0), // Matching padding
                ),
                child: const Text("Create Account"),
              ),
            ),

            const SizedBox(height: ecomSizes.spaceBtwnSections),
          ],
        ),
      ),
    );
  }
}