import 'package:ecom_store/common/widgets/appbar/appbar.dart';
import 'package:ecom_store/common/widgets/brands/brand_card.dart';
import 'package:ecom_store/common/widgets/products/sortable/sortable_products.dart';
import 'package:ecom_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ecomAppBar(title: Text("Nike"),showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(ecomSizes.defaultSpace),
        child: Column(
          children: [
            /// Brand Detail
            ecomBrandCard(),
            SizedBox(height: ecomSizes.spaceBtwnSections),

            ecomSortableProducts(),
          ],

        ),
        ),
      ),
    );
  }
}
