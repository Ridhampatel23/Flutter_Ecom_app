import 'package:ecom_store/common/styles/spacing_styles.dart';
import 'package:ecom_store/features/authentication/screens/login/widgets/login_form.dart';
import 'package:ecom_store/features/authentication/screens/login/widgets/login_header.dart';
import 'package:ecom_store/utils/constants/sizes.dart';
import 'package:ecom_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/login_setup/form_divider.dart';
import '../../../../common/widgets/login_setup/social_buttons.dart';

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
              ecomLoginHeader(dark: dark),

              ///Form
              const ecomLoginForm(),

              ///Divider
              ecomFormDivider(dark: dark, dividerText: "Or Sign In With"),

              const SizedBox(height: ecomSizes.spaceBtwnSections),

              ///Footer
              const ecomSocialButton()
            ],
          ),
        ),
      ),
    );
  }
}






