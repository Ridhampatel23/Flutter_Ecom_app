import 'package:ecom_store/common/widgets/texts/section_heading.dart';
import 'package:ecom_store/features/shop/screens/cart/cart.dart';
import 'package:ecom_store/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:ecom_store/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:ecom_store/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:ecom_store/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:ecom_store/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:ecom_store/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:ecom_store/utils/constants/sizes.dart';
import 'package:ecom_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../../models/product_model.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = ecomHelperFunctions.isDarkMode(context);

    return  Scaffold(
      bottomNavigationBar: const ecomBottonAddToCart(),
      body: SingleChildScrollView(
        //physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            ///Product Image Slider
            ecomProductImageSlider(product: product),

            /// -- Product Details
            Padding(padding: const EdgeInsets.only(right: ecomSizes.defaultSpace, left: ecomSizes.defaultSpace,top: ecomSizes.defaultSpace),
            child: Column(
              children: [
                /// - Ratings & Share Button
                const ecomRatingsAndShare(),


                ///Price, Title, Stock and Brand
                ecomProductMetaData(product: product),
                const SizedBox(height: ecomSizes.spaceBtwnItems / 2),


                /// -- Attributes
                const ecomProductAttributes(),
                const SizedBox(height: ecomSizes.spaceBtwnSections),

                ///  -- Checkout Button
                SizedBox(height: 50, width: double.infinity, child: ElevatedButton(onPressed: () => Get.to(() => const CartScreen()), child: const Text("Checkout"))),
                const SizedBox(height: ecomSizes.spaceBtwnSections),

                ///  -- Description
                const ecomSectionHeading(title: "Description", showActionButton: false),
                const SizedBox(height: ecomSizes.spaceBtwnItems),
                const ReadMoreText(
                  "These are one of the OG Colorway Nike Dunks in Green. Jordan fueled all his love and heart creating these. Buy these and feel like a king of sneaker heads ",
                  trimLines: 2,
                  colorClickableText: Colors.blue,
                  trimMode: TrimMode.Line ,
                  trimCollapsedText: "Show More",
                  trimExpandedText: "Show Less",
                  moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                ),

                ///  -- Reviews
                const Divider(),
                const SizedBox(height: ecomSizes.spaceBtwnItems),
                ecomSectionHeading(title: "Reviews (199)", onPressed: () => Get.to(() => const ProductReviewsScreen())),
                const SizedBox(height: ecomSizes.spaceBtwnSections),

              ],
            ),
            )
          ],
        ),
      ),
    );
  }
}


