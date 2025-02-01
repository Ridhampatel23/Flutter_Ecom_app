import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ecom_store/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:ecom_store/features/shop/controllers/product/product_controller.dart';
import 'package:ecom_store/features/shop/models/product_model.dart';
import 'package:ecom_store/features/shop/screens/all_products/all_products.dart';
import 'package:ecom_store/features/shop/screens/home/widgets/home_categories.dart';
import 'package:ecom_store/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:ecom_store/utils/constants/colors.dart';
import 'package:ecom_store/utils/constants/images_strings.dart';
import 'package:ecom_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/seach_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import 'widgets/home_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
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

                        /// ---Categories ---
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
                  const ecomPromoSlider(),
                  const SizedBox(height: ecomSizes.spaceBtwnSections),

                  ///-- Heading --
                  ecomSectionHeading(
                    title: "Popular Products",
                    onPressed: () => Get.to(() => AllProductsScreen(
                          title: 'Popular Products',
                          // query: FirebaseFirestore.instance              This is just an example if you wanna use query instead of future method
                          //     .collection('Products')
                          //     .where('IsFeatured', isEqualTo: true)
                          //     .limit(6),
                      futureMethod: controller.fetchAllFeaturedProducts(),
                        )),
                  ),
                  const SizedBox(height: ecomSizes.spaceBtwnItems),

                  Obx(() {
                    if (controller.isLoading == true)
                      return ecomVerticalProductShimmer();

                    if (controller.featuredProducts.isEmpty) {
                      return Center(
                        child: Text('No Data Found!',
                            style: Theme.of(context).textTheme.bodyMedium),
                      );
                    }
                    return ecomGridLayout(
                        itemCount: controller.featuredProducts.length,
                        itemBuilder: (_, index) => ecomProductCardVertical(
                            product: controller.featuredProducts[index]));
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
