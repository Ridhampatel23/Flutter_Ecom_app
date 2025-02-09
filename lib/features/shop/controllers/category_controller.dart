

import 'package:ecom_store/data/repositories/categories/category_repository.dart';
import 'package:ecom_store/data/repositories/product/product_repository.dart';
import 'package:ecom_store/features/shop/models/category_model.dart';
import 'package:ecom_store/utils/popups/loaders.dart';
import 'package:get/get.dart';

import '../models/product_model.dart';

// This class's role is to use the Category Repository, display a loader, fetch the data and close the loader
// Also, this class should fetch all the categories only one time once the application loads, to avoid a hectic approach, minimizing the reads at last.

class CategoryController extends GetxController{
  static CategoryController get instance => Get.find();

  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }


  ///  -- Load category data
  Future<void> fetchCategories() async {
    try{
      // Show loader while loading categories
      isLoading.value = true;

      // Fetch Categories from data source (Firestore, Api, etc.)
      final categories = await _categoryRepository.getAllCategories();

      // Update the categories list
      allCategories.assignAll(categories);

      // Filter featured Categories
      featuredCategories.assignAll(allCategories.where((category) => category.isFeatured && category.parentId.isEmpty).take(8).toList());

    } catch (e){
      ecomLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // Remove Loader
      isLoading.value = false;
    }
  }

  ///  -- Load Selected Category data


  ///  -- Get Category or Sub - Category Products
  Future<List<ProductModel>> getCategoryProducts({required String categoryId, int limit = 4}) async {

    // Fetch limited (4) products for each subCategory;
    final products = await ProductRepository.instance.getProductsForCategory(categoryId: categoryId, limit: limit);
    return products;
  }

}