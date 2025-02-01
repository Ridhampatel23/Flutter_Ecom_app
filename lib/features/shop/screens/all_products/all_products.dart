import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_store/common/widgets/appbar/appbar.dart';
import 'package:ecom_store/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:ecom_store/features/shop/controllers/all_products_controller.dart';
import 'package:ecom_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../common/widgets/products/sortable/sortable_products.dart';
import '../../models/product_model.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key, required this.title, this.query, this.futureMethod});

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(AllProductsController());

    return Scaffold(
      appBar: ecomAppBar(
        title: Text(title),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ecomSizes.defaultSpace),
          child: FutureBuilder(
            future: futureMethod ?? controller.fetchProductsByQuery(query) ,
            builder: (context, snapshot) {
              // Check the state of the FutureBuilder snapShot
              const loader = ecomVerticalProductShimmer();
              if (snapshot.connectionState == ConnectionState.waiting) {
                return loader;
              }

              if(!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty){
                return const Center(child: Text('No Data Found'));
              }

              if(snapshot.hasError){
                return const Center(child: Text('Something went wrong.'));
              }

              // Products Found!
              final products = snapshot.data!;

              return ecomSortableProducts();
            }
          ),
        ),
      ),
    );
  }
}

