import 'package:ecom_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ecom_store/features/shop/screens/home/widgets/home_categories.dart';
import 'package:ecom_store/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:ecom_store/utils/constants/colors.dart';
import 'package:ecom_store/utils/constants/images_strings.dart';
import 'package:ecom_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/seach_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import 'widgets/home_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            ///Primary header
            //Primary header is the blur part of the home screen
            const ecomPrimaryHeaderContainer(
              child: Column(
                children: [

                  ///AppBar
                  ecomHomeAppBar(),
                  SizedBox(height: ecomSizes.spaceBtwnSections),

                  ///Search Bar
                  ecomSearchContainer(text: 'Search in store'),
                  SizedBox(height: ecomSizes.spaceBtwnSections),

                  Padding(
                    padding: EdgeInsets.only(left: ecomSizes.defaultSpace),
                    child: Column(
                      children: [

                        /// -- Heading --

                        ecomSectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: ecomColors.whiteColor,
                        ),
                        SizedBox(height: ecomSizes.spaceBtwnItems),

                        /// ---Caregories ---
                        ecomHomeCategories(),
                        SizedBox(height: ecomSizes.spaceBtwnSections),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            ///Body
            Padding(
              padding: const EdgeInsets.all(ecomSizes.defaultSpace),
              child: Column(
                children: [

                  /// -- Promo Slider --
                  const ecomPromoSlider(
                    banners: [
                      ecomImages.newArrivals,
                      ecomImages.snkrsRestock,
                      ecomImages.sneakerOfTheWeek,
                    ],
                  ),
                  const SizedBox(height: ecomSizes.spaceBtwnSections ),

                  ///-- Heading --
                  ecomSectionHeading(title: "Popular Categories", onPressed: () {},),
                  const SizedBox(height: ecomSizes.spaceBtwnItems),

                  ecomGridLayout(itemCount: 4, itemBuilder: (_ , index) => const ecomProductCardVertical()),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

