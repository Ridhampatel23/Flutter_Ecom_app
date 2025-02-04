import 'package:ecom_store/common/widgets/appbar/appbar.dart';
import 'package:ecom_store/common/widgets/brands/brand_card.dart';
import 'package:ecom_store/common/widgets/layouts/grid_layout.dart';
import 'package:ecom_store/common/widgets/texts/section_heading.dart';
import 'package:ecom_store/features/shop/controllers/brand_controller.dart';
import 'package:ecom_store/features/shop/models/brand_model.dart';
import 'package:ecom_store/features/shop/screens/brand/brand_products.dart';
import 'package:ecom_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/shimmers/brands_shimmer.dart';
import '../../../../utils/constants/colors.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Since we have to Display the data that we already fetched, we will find the
    // Instance of brand controller instead of making a new one.
    final controller = BrandController.instance;
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
            Obx(
                    () {
                  if(controller.isLoading.value) return const ecomBrandsShimmer();

                  if(controller.allBrands.isEmpty){
                    return Center(
                      child: Text('No Data Found', style: Theme.of(context).textTheme.bodyMedium!.apply(color: ecomColors.whiteColor)),
                    );
                  }

                  return  ecomGridLayout(
                      itemCount: controller.allBrands.length,
                      mainAxisExtent: 80,
                      itemBuilder: (_, index) {
                        final brand = controller.allBrands[index];
                        return ecomBrandCard(showBorder: true, brand: brand, onTap: () => Get.to(() => BrandProducts(brand: brand)));
                      });
                }
            ),          ],
        ),
        ),
      ),
    );
  }
}
