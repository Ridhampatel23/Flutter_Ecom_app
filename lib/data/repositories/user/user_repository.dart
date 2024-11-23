

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_store/features/authentication/controllers/signup/user_model.dart';
import 'package:ecom_store/utils/exceptions/firebase_exceptions.dart';
import 'package:ecom_store/utils/exceptions/format_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController{
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Functions to store user data  to Firestore
  Future<void> saveUserRecord(UserModel user) async {
    try{
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw ecomFirebaseException(e.code).message;
    } on FormatException catch (_){
      throw const ecomFormatException();
    } on PlatformException catch (e) {
      throw ecomFormatException(e.code).message;
    } catch (e){
      throw "Something went wrong, Please try again";
    }
  }

  // Function to fetch user details based on user ID
  //Function to update user data on FireStore

}