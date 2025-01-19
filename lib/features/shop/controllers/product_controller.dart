
import 'package:ecom_store/features/shop/models/product_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final productRepository = Get.put(ProductReository());
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

    } finally{
      isLoading.value = false;
    }

  }
}