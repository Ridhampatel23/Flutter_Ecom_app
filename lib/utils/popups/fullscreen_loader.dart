import 'package:ecom_store/app.dart';
import 'package:ecom_store/utils/constants/colors.dart';
import 'package:ecom_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../common/widgets/loaders/animation_loader.dart';

/// A utility class for managing a full screen loading display
class ecomFullScreenLoader {
  /// Open a full screen loading dialogue with a given text and animation,
  /// This method doesn't return anything
  ///
  /// Parameters:
  ///  - text: The text to be displayed in the loading dialogue
  ///  - animation: The Lattice animation to be shown

  static void openLoadingDialogue(String text, String animation){
    showDialog(context: Get.overlayContext!,
        barrierDismissible: false,
        builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: ecomHelperFunctions.isDarkMode(Get.context!) ? ecomColors.dark : ecomColors.whiteColor,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 250), // Adjust the spacing as needed
              ecomAnimationLoaderWidget(text: text, animation: animation),
            ],
          ),
        )
    ),
    );
  }

  /// Stop the currently open loading dialogue
  /// This method doesn't return anything.
  static stopLoading(){
    Navigator.of(Get.overlayContext!).pop(); //Close the dialogue using the Navigator
  }


}