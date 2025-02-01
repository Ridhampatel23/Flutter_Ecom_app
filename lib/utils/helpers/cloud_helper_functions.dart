

import 'package:ecom_store/features/personalization/screens/profile/widget/re_authenticate_user_login_form.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

/// Helper Functions for cloud related operations
class ecomCloudHelperFunctions {

  /// Helper function to check the state of a single database record
  ///
  /// Returns a widget based on the state of the snapshot.
  /// If data is still loading, it returns a CircularProgressIndicator.
  /// If no data is found, it returns a generic 'No Data Found' message.
  /// If and error occurs, it returns an error message.
  /// otherwise, returns null
  static Widget? checkSingleRecordState<ecom>(AsyncSnapshot<ecom> snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting){
      return const Center(child: CircularProgressIndicator());
    }

    if (!snapshot.hasData || snapshot.data == null) {
      return const Center(child: Text('No Data Found'));
    }

    if (snapshot.hasError){
      return const Center(child: Text('Something went wrong. '));
    }

    return null;
  }




  /// Helper function to check the state of a single database record
  ///
  /// Returns a widget based on the state of the snapshot.
  /// If data is still loading, it returns a CircularProgressIndicator.
  /// If no data is found, it returns a generic 'No Data Found' message.
  /// If and error occurs, it returns an error message.
  /// otherwise, returns null
  static Widget? checkMultiRecordState<ecom>({required AsyncSnapshot<List<ecom>> snapshot, Widget? loader, Widget? error, Widget? nothingFound}) {
    if (snapshot.connectionState == ConnectionState.waiting){
      if(loader != null) return loader;
      return const Center(child: CircularProgressIndicator());
    }

    if (!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty) {
      if(nothingFound != null) return nothingFound;
      return const Center(child: Text('No Data Found'));
    }

    if (snapshot.hasError){
      if (error != null) return error;
      return const Center(child: Text('Something went wrong. '));
    }

    return null;
  }

  /// Create a reference with an initial file path and name and retrieve the download URL
  static Future<String> getUrlFromFilePathAndName(String path) async {
    try {
      if (path.isEmpty) return '';
      final ref = FirebaseStorage.instance.ref().child(path);
      final url = await ref.getDownloadURL();
      return url;
    }on FirebaseException catch (e){
      throw e.message!;}
    on PlatformException catch (e){
      throw e.message!;
    } catch (e){
      throw 'Something went wrong.';
    }
  }
}