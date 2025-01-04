import 'package:ecom_store/common/widgets/login_setup/form_divider.dart';
import 'package:ecom_store/common/widgets/login_setup/social_buttons.dart';
import 'package:ecom_store/features/authentication/screens/singup/widgets/signup_form.dart';
import 'package:ecom_store/utils/constants/sizes.dart';
import 'package:ecom_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar/appbar.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ecomHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: const ecomAppBar(showBackArrow: true, padding: 0),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ecomSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Title
              Text("Sign up",
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: ecomSizes.spaceBtwnSections),

              ///Form
              const ecomSignupForm(),
              const SizedBox(height: ecomSizes.spaceBtwnSections),

              ///Divider
              ecomFormDivider(dark: dark, dividerText: "Or Sign Up With"),

              const SizedBox(height: ecomSizes.spaceBtwnSections),

              ///Social Buttons
              const ecomSocialButton(),
            ],
          ),
        ),
      ),
    );
  }
}
