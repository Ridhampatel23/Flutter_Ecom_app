import 'package:ecom_store/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:ecom_store/features/authentication/screens/onboarding/widgets/onboarding_navigation_dots.dart';
import 'package:ecom_store/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:ecom_store/utils/constants/colors.dart';
import 'package:ecom_store/utils/constants/images_strings.dart';
import 'package:ecom_store/utils/constants/sizes.dart';
import 'package:ecom_store/utils/constants/text_strings.dart';
import 'package:ecom_store/utils/device/device_utility.dart';
import 'package:ecom_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'widgets/onboarding_page.dart';
import 'widgets/onboarding_skip.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          ///Horizontal Scrollable page
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingWidget(
                image: ecomImages.onBoardingImage1,
                title: ecomTexts.onBoardingTitle1,
                subTitle: ecomTexts.onBoardingSubTitle1,
              ),
              OnBoardingWidget(
                image: ecomImages.onBoardingImage2,
                title: ecomTexts.onBoardingTitle2,
                subTitle: ecomTexts.onBoardingSubTitle2,
              ),
              OnBoardingWidget(
                image: ecomImages.onBoardingImage3,
                title: ecomTexts.onBoardingTitle3,
                subTitle: ecomTexts.onBoardingSubTitle3,
              ),
            ],
          ),

          ///Skip Button to skip to the last page
          const OnBoardingSkipButton(),

          ///Dot Navigation SmoothPageIndicator
          const OnBoardingNavigationDots(),

          ///Circular Button
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}

