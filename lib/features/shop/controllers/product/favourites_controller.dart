
import 'dart:convert';

import 'package:ecom_store/data/repositories/product/product_repository.dart';
import 'package:ecom_store/features/shop/models/product_model.dart';
import 'package:ecom_store/utils/local_storage/storage_utility.dart';
import 'package:ecom_store/utils/popups/loaders.dart';
import 'package:get/get.dart';

class FavouritesController extends GetxController{
  static FavouritesController get instance => Get.find();

  @override
  void onInit() {
    super.onInit();
    initFavourites();
  }

  /// Variables
  final favourites = <String, bool>{}.obs;
  
// Method to initialize favourites by reading from storage
  void initFavourites()  {
    final json = ecomLocalStorage.instance().readData('favourites');
    if(json != null){
      final storedFavourites = jsonDecode(json) as Map<String, dynamic>;
      favourites.assignAll(storedFavourites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavourite(String productId) {
    return favourites[productId] ?? false;
  }

  void toggleFavouriteProduct(String productId){
    if(!favourites.containsKey(productId)){
     favourites[productId] = true;
     saveFavouritesToStorage();
     ecomLoaders.customToast(message: 'Product has been added to the wishlist!');
    } else {
      ecomLocalStorage.instance().removeData(productId);
      favourites.remove(productId);
      saveFavouritesToStorage();
      favourites.refresh();
      ecomLoaders.customToast(message: 'Product has been removed from the wishlist!');
    }
  }

  void saveFavouritesToStorage() {
    final encodedFavourites = json.encode(favourites);
    ecomLocalStorage.instance().saveData('favourites', encodedFavourites);
  }

  Future<List<ProductModel>> favouriteProducts() async {
    return await ProductRepository.instance.getFavouriteProducts(favourites.keys.toList());
  }

}