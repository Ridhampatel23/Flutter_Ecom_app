
import 'package:ecom_store/data/repositories/product/product_repository.dart';
import 'package:ecom_store/features/shop/models/product_model.dart';
import 'package:ecom_store/utils/popups/loaders.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/enums.dart';

class ProductController extends GetxController{
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  // async because of cloud query, also always make sure to use try catch on every cloud query
  void fetchFeaturedProducts() async {
    try{
      // show loader while loading products
      isLoading.value = true;

      // Fetch Products
      final products = await productRepository.getFeaturedProducts();

      // Assign Products
      featuredProducts.assignAll(products);


    } catch(e) {
      ecomLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally{
      isLoading.value = false;
    }
  }

  /// Get the product price or price range for variations
 String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    // If no variations erxist, return the simple price or sale price
   if(product.productType == ProductType.single.toString()){
     return (product.salePrice > 0 ? product.salePrice : product.price).toString();
   } else {
     // Calculate the smallest and largest prices among variations
     for(var variation in product.productVariations!){
       // Determine the price to consider (sale price if available, otherwise regular price)
       double priceToConsider = variation.salePrice > 0.0 ? variation.salePrice : variation.price;

       // Update the smallest and largest price
       if (priceToConsider < smallestPrice) {
         smallestPrice = priceToConsider;
       }
       if (priceToConsider > largestPrice){
         largestPrice = priceToConsider;
       }
     }

     // If smallest and largest prices are the same , return a single price
     if (smallestPrice.isEqual(largestPrice)){
       return largestPrice.toString();
     } else {
       // Otherwise return a price range
       return '$smallestPrice - \$$largestPrice';
     }
   }
 }

 /// -- Calculate Discount Percentage
 String? calculateSalePercentage(double originalPrice, double? salePrice) {
    if(salePrice == null || salePrice <= 0.0) return null;
    if(originalPrice <= 0) return null;

    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
 }

  /// -- Check Product Stock Status
  String getProductStockStatus (int stock){
    return stock > 0 ? 'In Stock' : 'Out of Stock';
  }
}