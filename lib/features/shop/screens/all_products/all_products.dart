import 'package:ecom_store/common/widgets/appbar/appbar.dart';
import 'package:ecom_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/products/sortable/sortable_products.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ecomAppBar(
        title: Text("Popular Products"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ecomSizes.defaultSpace),
          child: ecomSortableProducts(),
        ),
      ),
    );
  }
}

