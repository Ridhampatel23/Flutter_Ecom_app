import 'package:ecom_store/features/authentication/controllers/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/images_strings.dart';
import '../../../utils/constants/sizes.dart';

class ecomSocialButton extends StatelessWidget {
  const ecomSocialButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: ecomColors.greyColor),
              borderRadius: BorderRadius.circular(60)),
          child: IconButton(
            onPressed: () => controller.googleSignIn(),
            icon: const ClipOval(
              child: Image(
                width: ecomSizes.iconLarge,
                height: ecomSizes.iconLarge,
                image: AssetImage(ecomImages.GoogleLogo),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),

        const SizedBox(width: ecomSizes.spaceBtwnItems),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: ecomColors.greyColor),
              borderRadius: BorderRadius.circular(60)),
          child: IconButton(
            onPressed: () {},
            icon: const ClipOval(
              child: Image(
                width: ecomSizes.iconLarge,
                height: ecomSizes.iconLarge,
                image: AssetImage(ecomImages.FacebookLogo),
                fit: BoxFit.fill,
              ),
            ),
          ),
        )
      ],
    );
  }
}
