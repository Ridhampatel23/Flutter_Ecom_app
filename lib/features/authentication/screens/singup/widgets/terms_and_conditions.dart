import 'package:ecom_store/features/authentication/controllers/signup/signup_controller.dart';
import 'package:ecom_store/features/authentication/screens/singup/widgets/privacy_policy_video.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class ecomTermsAndConditions extends StatelessWidget {
  const ecomTermsAndConditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final dark = ecomHelperFunctions.isDarkMode(context);

    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(() => Checkbox(
                value: controller.privacyPolicy.value,
                onChanged: (value) => controller.privacyPolicy.value =
                    !controller.privacyPolicy.value,
              )),
        ),
        const SizedBox(width: ecomSizes.spaceBtwnItems),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: "I agree to ",
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                text: "Privacy Policy ",
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark
                          ? ecomColors.whiteColor
                          : ecomColors.primaryColor,
                      decoration: TextDecoration.underline,
                      decorationColor: dark
                          ? ecomColors.whiteColor
                          : ecomColors.primaryColor,
                    ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // Navigate to the PrivacyPolicyVideoScreen
                    Get.to(() => PrivacyPolicyVideoScreen());
                  },
              ),
              TextSpan(
                  text: "and ", style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                text: "Terms of Use",
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark
                          ? ecomColors.whiteColor
                          : ecomColors.primaryColor,
                      decoration: TextDecoration.underline,
                      decorationColor: dark
                          ? ecomColors.whiteColor
                          : ecomColors.primaryColor,
                    ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // Navigate to the PrivacyPolicyVideoScreen
                    Get.to(() => PrivacyPolicyVideoScreen());
                  },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
