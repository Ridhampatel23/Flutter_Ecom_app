
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_store/features/shop/models/banner_model.dart';
import 'package:ecom_store/utils/exceptions/firebase_exceptions.dart';
import 'package:ecom_store/utils/exceptions/format_exceptions.dart';
import 'package:ecom_store/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BannerRepository extends GetxController{
  static BannerRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get all order related to current user
  Future<List<BannerModel>> fetchBanners() async{
    try{
      final result = await _db.collection('Banners').where('Active', isEqualTo: true).get();
      return result.docs.map((documentSnapshot) => BannerModel.fromSnapshot(documentSnapshot)).toList();

    } on FirebaseException catch(e){
      throw ecomFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw ecomPlatformException(e.code).message;
    } on FormatException catch (e) {
      throw const ecomFormatException();
    } catch (e){
      throw 'Something went wrong while fetching Banners!';
    }
  }

  /// Upload Banners to the Cloud Firebase
}