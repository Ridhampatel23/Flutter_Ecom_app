

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_store/data/repositories/product/product_repository.dart';
import 'package:ecom_store/features/shop/models/product_model.dart';
import 'package:ecom_store/utils/popups/loaders.dart';
import 'package:get/get.dart';

class AllProductsController extends GetxController{
static AllProductsController get instance => Get.find();

  final repository = ProductRepository.instance;
  final RxString selectedSortOption = 'Name'.obs;
  final RxList<ProductModel> products = <ProductModel>[].obs;

  Future<List<ProductModel>> fetchProductsByQuery(Query? query) async {
    try {
      if (query == null) return [];

      final products = await repository.fetchProductsByQuery(query);

      return products;
    } catch (e){
      ecomLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
      return [];
    }
  }

void sortProducts (String sortOptions){
  selectedSortOption.value = sortOptions;

  switch(sortOptions){
    case 'Name':
      products.sort((a, b) => a.title.compareTo(b.title));
      break;
    case 'Price: High - Low':
      products.sort((a, b) => b.price.compareTo(a.price));
      break;
    case 'Price: Low - high':
      products.sort((a, b) => a.price.compareTo(b.price));
      break;
    case 'New Arrivals':
      products.sort((a, b) => b.date!.compareTo(b.date!));
      break;
    case 'Sale':
      products.sort((a, b) {
        if(b.salePrice > 0) {
          return b.salePrice.compareTo(a.salePrice);
        } else if (a.salePrice > 0){
          return -1;
        } else {
          return -1;
        }
      });
      break;
    default:
      // Default sorting option: Name
      products.sort((a, b) => a.title.compareTo(b.title));
  }
}

void assignProducts(List<ProductModel> products){
    //Assign products to the 'Products' List
  this.products.assignAll(products);
  sortProducts('Name');
}

}

