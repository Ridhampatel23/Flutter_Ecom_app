
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_store/features/shop/models/category_model.dart';
import 'package:ecom_store/utils/exceptions/firebase_exceptions.dart';
import 'package:ecom_store/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

// The responsibility of this class is to only deal with Firestore and catch exception,
// no fancy stuffs like loaders here!
class CategoryRepository extends GetxController{
  static CategoryRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get all the Categories
  Future<List<CategoryModel>> getAllCategories() async {
    try{
      final snapShot = await _db.collection('Categories').get();
      final list = snapShot.docs.map((document) => CategoryModel.fromSnapshot(document)).toList();
      return list;
    } on FirebaseException catch(e){
      throw ecomFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw ecomPlatformException(e.code).message;
    }catch (e){
      throw 'Something went wrong, Please try again.';
    }
  }

  /// Get Sub Categories

  /// Upload Categories to the Cloud Firestore
  /*Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try{
      // Upload all tge Categories along with their images
      final storage = Get.put(ecomFirebaseStorageService());

      // Loop through each Category
      for (var category in categories){
        // Get ImageData link from the local Assets
        final file = await  storage.getImageDataFromAssets(category.image);

        // Upload Image and get its URL
        final url = await storage.uploadImageData('Categories', file, category.name);

        // Assign URL to Category.image attribute
        category.image = url;

        // Store Category in Firestore
        await _db.collection("Categories").doc(category.id).set(category.toJson());
      }

    }on FirebaseException catch (e){
      throw ecomFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw ecomPlatformException(e.code).message;
    } catch(e){
      throw 'Something went wrong. Please try again';
    }
  } */
}