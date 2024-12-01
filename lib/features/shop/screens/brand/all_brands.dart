import 'package:ecom_store/common/widgets/appbar/appbar.dart';
import 'package:ecom_store/common/widgets/brands/brand_card.dart';
import 'package:ecom_store/common/widgets/layouts/grid_layout.dart';
import 'package:ecom_store/common/widgets/texts/section_heading.dart';
import 'package:ecom_store/features/shop/screens/brand/brand_products.dart';
import 'package:ecom_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ecomAppBar(title: Text("Brands"), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(ecomSizes.defaultSpace),
        child: Column(
          children: [
            ///Heading
            const ecomSectionHeading(title: "Brands", showActionButton: false),
            const SizedBox(height: ecomSizes.spaceBtwnItems),

            /// ---Brands
            ecomGridLayout(itemCount: 10,mainAxisExtent: 80, itemBuilder: (_, index) => ecomBrandCard(onTap: () => Get.to(() => const BrandProducts())), ),
          ],
        ),
        ),
      ),
    );
  }
}
