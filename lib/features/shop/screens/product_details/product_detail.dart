import 'package:ecom_store/common/widgets/appbar/appbar.dart';
import 'package:ecom_store/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:ecom_store/common/widgets/icons/ecom_circular_icon.dart';
import 'package:ecom_store/common/widgets/images/ecom_rounded_banner.dart';
import 'package:ecom_store/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:ecom_store/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:ecom_store/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:ecom_store/utils/constants/colors.dart';
import 'package:ecom_store/utils/constants/images_strings.dart';
import 'package:ecom_store/utils/constants/sizes.dart';
import 'package:ecom_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = ecomHelperFunctions.isDarkMode(context);

    return  const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///Product Image Slider
            ecomProductImageSlider(),

            /// -- Product Details
            Padding(padding: EdgeInsets.only(right: ecomSizes.defaultSpace, left: ecomSizes.defaultSpace,bottom: ecomSizes.defaultSpace),
            child: Column(
              children: [
                /// - Ratings & Share Button
                ecomRatingsAndShare(),

                ///Price, Title, Stock and Brand
                ecomProductMetaData(),


                /// -- Attribute
                ///  -- Checkout Button
                ///  -- Description
                ///  -- Reviews
              ],
            ),
            )
          ],
        ),
      ),
    );
  }
}


