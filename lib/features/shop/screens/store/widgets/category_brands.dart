import 'package:ecom_store/common/widgets/brands/brand_showcase.dart';
import 'package:ecom_store/features/shop/controllers/brand_controller.dart';
import 'package:ecom_store/features/shop/models/category_model.dart';
import 'package:ecom_store/utils/constants/sizes.dart';
import 'package:ecom_store/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../common/widgets/shimmers/boxes_shimmer.dart';
import '../../../../../common/widgets/shimmers/list_tile_shimmer.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
        future: controller.getBrandsForCategory(category.id),
        builder: (context, snapshot) {
          /// Handle Loader, No Record, or Error Message
          const loader = Column(
            children: [
              ecomListTileShimmer(),
              SizedBox(height: ecomSizes.spaceBtwnItems),
              ecomBoxesShimmer(),
              SizedBox(height: ecomSizes.spaceBtwnItems),
            ],
          );

          final widget = ecomCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
          if(widget != null) return widget;

          /// Records Found
          final brands = snapshot.data!;

          return ListView.builder(
              itemBuilder: (_, index) {
                final brand = brands[index];
                return FutureBuilder(
                    future: controller.getBrandProducts(
                        brandId: brand.id, limit: 3),
                    builder: (context, snapshot) {
                      ///Handle Loader, No Record, or Error Messages
                      final widget = ecomCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                      if(widget != null) return widget;

                      /// Records Found
                      final products = snapshot.data!;

                      return ecomBrandShowcase(
                          images: products.map((e) => e.thumbnail).toList(),
                          brand: brand);
                    });
              },
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: brands.length);
        });
  }
}
