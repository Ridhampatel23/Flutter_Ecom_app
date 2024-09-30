import 'package:ecom_store/features/authentication/controllers_onboarding/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_functions.dart';

class OnBoardingNavigationDots extends StatelessWidget {
  const OnBoardingNavigationDots({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = ecomHelperFunctions.isDarkMode(context);

    return Positioned(
        bottom: ecomDeviceUtils.getBottomNavBarHeight() + 30,
        left: ecomSizes.defaultSpace,
        child: SmoothPageIndicator(
            controller: controller.pageController,
            onDotClicked: controller.dotNavigationClick,
            count: 3,
            effect:  ExpandingDotsEffect(
                activeDotColor: dark ? ecomColors.light : ecomColors.dark, dotHeight: 6)));
  }
}
