import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecom_store/features/shop/controllers/home_controller.dart';
import 'package:ecom_store/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../common/widgets/images/ecom_rounded_banner.dart';
import '../../../../../utils/constants/sizes.dart';

class ecomPromoSlider extends StatelessWidget {
  const ecomPromoSlider({
    super.key, required this.banners,
  });

  final List<String> banners;
  
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            aspectRatio: 16/9,
            onPageChanged: (index, _) => controller.updatePageIndicator(index),
          ),
          items: banners.map((url) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: ecomRoundedBanners( imageUrl: url))).toList(),
        ),
        const SizedBox(height: ecomSizes.spaceBtwnItems),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < banners.length; i++)
                  ecomCircularContainer(
                    width: 20,
                    height: 4,
                    margin: const EdgeInsets.only(right: 10),
                    bgColor: controller.carousalCurrentIndex.value == i ? ecomColors.primaryColor : ecomColors.greyColor,
                  )
              ],
            ),
          ),
        )
      ],
    );
  }
}
