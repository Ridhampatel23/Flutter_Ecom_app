import 'package:ecom_store/common/styles/spacing_styles.dart';
import 'package:ecom_store/utils/constants/colors.dart';
import 'package:ecom_store/utils/constants/sizes.dart';
import 'package:ecom_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:ecom_store/utils/constants/text_strings.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/images_strings.dart';
import '../../../../utils/theme/custom_themes/text_theme.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ecomHelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: ecomSpacingStyles.paddingWithAppBarHeight,
          child: Column(
            children: [
              ///Logo, Title and Subtitle
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    height: 150,
                    image: AssetImage(dark
                        ? ecomImages.lightAppLogo
                        : ecomImages.darkAppLogo),
                  ),
                  Text("Welcome Back",
                      style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: ecomSizes.small),
                  Text("Please go ahead and log in",
                      style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),

              ///Form
              Form(
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
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),  // Uniform padding
                          ),
                          child: const Text("Sign In"),
                        ),
                      ),

                      const SizedBox(height: ecomSizes.spaceBtwnItems),

                      ///Create Account Button
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),  // Matching padding
                          ),
                          child: const Text("Create Account"),
                        ),
                      ),

                      const SizedBox(height: ecomSizes.spaceBtwnSections),
                    ],
                  ),
                ),
              ),

              ///Divider
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(child: Divider(color: dark ? ecomColors.darkGreyColor : ecomColors.lightGreyColor,
                        thickness: 1,
                        indent: 60,
                        endIndent: 5),
                  ),
                  Flexible(child: Divider(color: dark ? ecomColors.darkGreyColor : ecomColors.lightGreyColor,
                        thickness: 1,
                        indent: 5,
                        endIndent: 60),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
