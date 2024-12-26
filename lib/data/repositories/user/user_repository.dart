import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_store/data/repositories/authentication/authentication_repository.dart';
import 'package:ecom_store/features/authentication/controllers/signup/user_model.dart';
import 'package:ecom_store/utils/exceptions/firebase_exceptions.dart';
import 'package:ecom_store/utils/exceptions/format_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Functions to store user data  to Firestore
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw ecomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const ecomFormatException();
    } on PlatformException catch (e) {
      throw ecomFormatException(e.code).message;
    } catch (e) {
      throw "Something went wrong, Please try again";
    }
  }

  /// Function to fetch user details based on user ID
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).get();
      if(documentSnapshot.exists) {
        return UserModel.fromSnapShot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseException catch (e) {
      throw ecomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const ecomFormatException();
    } on PlatformException catch (e) {
      throw ecomFormatException(e.code).message;
    } catch (e) {
      throw "Something went wrong, Please try again";
    }
  }

  ///Function to update user data on FireStore
  Future<void> updateUserDetails(UserModel updatedUser) async {
    try {
      await _db.collection("Users").doc(updatedUser.id).update(updatedUser.toJson());
    } on FirebaseException catch (e) {
      throw ecomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const ecomFormatException();
    } on PlatformException catch (e) {
      throw ecomFormatException(e.code).message;
    } catch (e) {
      throw "Something went wrong, Please try again";
    }
  }

  ///Function to update a specific field in the FireStore
  Future<void> updateSpecificField(Map<String, dynamic> json) async {
    try {
      await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).update(json);
    } on FirebaseException catch (e) {
      throw ecomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const ecomFormatException();
    } on PlatformException catch (e) {
      throw ecomFormatException(e.code).message;
    } catch (e) {
      throw "Something went wrong, Please try again";
    }
  }

  ///Function to remove a user from the FireStore
  Future<void> removeUserRecord(String userID) async {
    //Always delete the FireStore Record first before deleting the Authentication user as you will
    // lose the userId data which is required to access the specific document in the collection
    // and never find it in the firestore if you delete the Authentication user first.
    try {
      await _db.collection("Users").doc(userID).delete();
    } on FirebaseException catch (e) {
      throw ecomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const ecomFormatException();
    } on PlatformException catch (e) {
      throw ecomFormatException(e.code).message;
    } catch (e) {
      throw "Something went wrong, Please try again";
    }
  }
}
