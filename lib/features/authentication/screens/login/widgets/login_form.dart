import 'package:ecom_store/features/authentication/controllers/login/login_controller.dart';
import 'package:ecom_store/features/authentication/screens/password_config/forgot_password.dart';
import 'package:ecom_store/features/authentication/screens/singup/singup.dart';
import 'package:ecom_store/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';

class ecomLoginForm extends StatelessWidget {
  const ecomLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Form(
      /// loginFormKey is the Global form key that we created in our login controller
      key: controller.loginFormKey,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: ecomSizes.spaceBtwnSections),
        child: Column(
          children: [
            ///Email
            TextFormField(
              validator: (value) => ecomValidator.validateEmail(value),
              controller: controller.email,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right), labelText: "Email"),
            ),
            const SizedBox(height: ecomSizes.spaceBtwnInputFields),


            ///Password
            Obx(
              // An Obx widget observes the changes and redraws only the widget instead of redrawing the entire screen
              // when setState is used.
              () => TextFormField(
                validator: (value) =>
                    ecomValidator.validateEmptyText("Password", value),
                controller: controller.password,
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                      icon: Icon(controller.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye),
                      onPressed: () => controller.hidePassword.value =
                          !controller.hidePassword.value),
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: SizedBox(height: ecomSizes.spaceBtwnInputFields / 2),
            ),

            ///Remember Me and Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///Remember Me
                Row(
                  children: [
                    // If you encounter an error while passing rememberMe boolean, please remember
                    // that you cannot pass it since it is of type Rx and not an actual boolean value,
                    // So just add .value to remove the error.
                    Obx(
                      () => Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (value) => controller.rememberMe.value = !controller.rememberMe.value),
                    ),
                    const Text('Remember Me'),
                  ],
                ),

                ///Forgot Password
                TextButton(
                  onPressed: () => Get.to(() => const ForgotPassword()),
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
                onPressed: () => controller.emailAndPasswordLogIn(),
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
