import 'package:ecom_store/common/widgets/appbar/appbar.dart';
import 'package:ecom_store/common/widgets/brands/brand_card.dart';
import 'package:ecom_store/common/widgets/products/sortable/sortable_products.dart';
import 'package:ecom_store/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:ecom_store/features/shop/controllers/brand_controller.dart';
import 'package:ecom_store/features/shop/models/brand_model.dart';
import 'package:ecom_store/utils/constants/sizes.dart';
import 'package:ecom_store/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return  Scaffold(
      appBar: ecomAppBar(title: Text(brand.name)),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(ecomSizes.defaultSpace),
        child: Column(
          children: [
            /// Brand Detail
            ecomBrandCard(brand: brand),
            const SizedBox(height: ecomSizes.spaceBtwnSections),

            FutureBuilder(
              future: controller.getBrandProducts(brand.id),
              builder: (context, snapshot) {

                ///Handle Loader, No Record or Error Message
                const loader = ecomVerticalProductShimmer();
                final widget = ecomCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                if(widget != null) return widget;

                ///Record found!!!
                final brandProducts = snapshot.data!;
                return ecomSortableProducts(products: brandProducts);
              }
            ),
          ],

        ),
        ),
      ),
    );
  }
}
