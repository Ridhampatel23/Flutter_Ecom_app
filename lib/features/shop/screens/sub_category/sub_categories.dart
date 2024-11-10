import 'package:ecom_store/common/widgets/appbar/appbar.dart';
import 'package:ecom_store/common/widgets/images/ecom_rounded_banner.dart';
import 'package:ecom_store/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:ecom_store/common/widgets/texts/section_heading.dart';
import 'package:ecom_store/utils/constants/images_strings.dart';
import 'package:ecom_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ecomAppBar(
        title: Text("Sports"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ecomSizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              const ecomRoundedBanners(
                  imageUrl: ecomImages.snkrsRestock,
                  width: double.infinity,
                  applyImageRadius: true),
              const SizedBox(height: ecomSizes.spaceBtwnSections),

              /// Sub Categories
              Column(
                children: [
                  ///Heading
                  ecomSectionHeading(title: "Sports Shirts", onPressed: () {}),
                  const SizedBox(height: ecomSizes.spaceBtwnItems / 2),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      separatorBuilder: (context, index)=> const SizedBox(width: ecomSizes.spaceBtwnItems),
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          const ecomProductCardHorizontal(),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
