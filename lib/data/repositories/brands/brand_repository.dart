
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_store/features/shop/models/brand_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class BrandRepository extends GetxController{
  static BrandRepository get instance => Get.find();



  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get all categories
  Future<List<BrandModel>> getAllBrands() async {
    try{

      final snapShot = await _db.collection('Brands').get();
      final result = snapShot.docs.map((e) => BrandModel.fromSnapshot(e)).toList();
      return result;

    } on FirebaseException catch(e){
      throw ecomFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw ecomPlatformException(e.code).message;
    } on FormatException catch (e) {
      throw const ecomFormatException();
    } catch (e){
      throw 'Something went wrong while fetching Brands!';
    }
  }

  /// Get Brands for Category

}