

import 'package:ecom_store/data/repositories/product/product_repository.dart';
import 'package:ecom_store/features/shop/models/brand_model.dart';
import 'package:ecom_store/features/shop/models/product_model.dart';
import 'package:ecom_store/utils/popups/loaders.dart';
import 'package:get/get.dart';

import '../../../data/repositories/brands/brand_repository.dart';

class BrandController extends GetxController{
  static BrandController get instance => Get.find();

  final RxList<BrandModel> featureBrands = <BrandModel>[].obs;
  final RxList<BrandModel> allBrands = <BrandModel>[].obs;
  RxBool isLoading = true.obs;
  final brandRepository = Get.put(BrandRepository());

  @override
  void onInit() {
    super.onInit();
    getFeaturedBrands();
  }

  /// -- Load Brands
  Future<void> getFeaturedBrands() async {
    // Always wrap cloud queries in try catch to catch all the runtime errors
    try{
      // Show Loader While Loading Brands
      isLoading.value = true;

      final brands = await brandRepository.getAllBrands();

      allBrands.assignAll(brands);

      featureBrands.assignAll(allBrands.where((brand) => brand.isFeatured ?? false).take(4));

    } catch(e) {
      ecomLoaders.errorSnackBar(title: 'Oh Snap!', message:  e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// -- Get Brands For Category
  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try {
      final brands = await brandRepository.getBrandsForCategory(categoryId);
      return brands;
    } catch (e) {
      ecomLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  /// Get Brand Specific Products from your data source
  Future<List<ProductModel>> getBrandProducts({required String brandId, int limit = -1}) async {
    try {
      final products = await ProductRepository.instance.getProductsForBrand(brandId: brandId, limit:  limit);
      return products;
    } catch (e) {
      ecomLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }


}