

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_store/features/shop/models/product_model.dart';
import 'package:ecom_store/utils/exceptions/firebase_exceptions.dart';
import 'package:ecom_store/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

/// Repository for managing product-related data and operations
class ProductRepository extends GetxController{
  static ProductRepository get instance => Get.find();

  /// Firestore instance for database interactions
  final _db = FirebaseFirestore.instance;

  /// Get limited featured products
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db.collection('Products').where('IsFeatured', isEqualTo: true).limit(4).get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch(e){
      throw ecomFirebaseException(e.code).message;
    } on PlatformException catch(e) {
      throw ecomPlatformException(e.code).message;
    }catch (e){
      throw 'Something went wrong. Please try again';
    }
  }

  /// TODO : Uncomment when Storage Service class is created ; Upload dummy data to the Cloud Firestore
 /*Future<void> uploadDummyData(List<ProductModel> products) async {
   try{
     // Upload all the products along with their images
     final storage = Get.put(ecomFirebaseStorageService());

     // Loop through each product
     for (var product in products){
       // Get Image data link from local assets
       final thumbnail = await storage.getImageDataFromAssets(product.thumbnail);

       // Upload all image and get its URL
       final url = await storage.uploadImageData('Products/Images', thumbnail, product.thumbnail.toString());

       // Assign URL to product.thumbnail attribute
       product.thumbnail  = url;

       // Product List of Images
       if(
       product.images != null && product.images!.isNotEmpty){
         List<String> imagesUrl = [];
         for (var image in product.images!){
           // Get image data link from local assets
           final assetImage = await storage.getImageDataFromAssets(image);

           // Upload image and get its URL
           final url = await storage.uploadImageData('Products/Images', assetImage, image);

           // Assign url to product.thumbnail attribute
           imagesUrl.add(url);

         }
         product.images!.clear();
         product.images!.addAll(imagesUrl);
       }

       // Upload Variation Images
        if(product.productType == ProductType.variable.toString()) {
          for(var variation in product.productVariations!){
            // Get image data link from local assets
            final assetImage = await storage.getImageDataFromAssets(variation.image);

            //Upload image and get its URL
            final url = await storage.uploadImageData('Products/Images', assetImage. variation.image);

            // Assign URL to variation.image attribute
            variation.image = url;
          }
        }

        // Store product in FireStore
       await _db.collection("Products").doc(product.id).set(product.toJson());

     }
   } on FirebaseException catch(e) {
     throw e.message!;
   } on SocketException catch(e) {
     throw e.message!;
   } on PlatformException catch(e) {
     throw e.message!;
   } catch (e) {
     throw e.toString();
   }
 } */
}
