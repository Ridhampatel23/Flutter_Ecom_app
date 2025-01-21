import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecom_store/features/shop/models/product_model.dart';
import 'package:ecom_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageController extends GetxController {
  static ImageController get instance => Get.find();

  /// Variables
  RxString selectedProductImage = ''.obs;

  /// Get All Images from product and Variations
  List<String> getAllProductImages(ProductModel product) {
    // User a set to add Unique images only
    Set<String> images = {};

    // Load thumbnail image
    images.add(product.thumbnail);

    // Assign thumbnail as Selected Image
    selectedProductImage.value = product.thumbnail;

    // Get all images from the Product Model if not null
    if (product.images != null) {
      images.addAll(product.images!);
    }

    // Get all images from the Product Variations if not null
    if (product.productVariations != null ||
        product.productVariations!.isNotEmpty) {
      images.addAll(
          product.productVariations!.map((variations) => variations.image));
    }

    return images.toList();
  }

  /// Show Image Popup
  void showEnalargedImage(String image) {
    Get.to(
      fullscreenDialog: true,
      () => Dialog.fullscreen(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: ecomSizes.defaultSpace * 2,
                  horizontal: ecomSizes.defaultSpace),
              child: CachedNetworkImage(imageUrl: image),
            ),
            const SizedBox(height: ecomSizes.spaceBtwnSections),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 150,
                child: OutlinedButton(
                    onPressed: () => Get.back(), child: const Text('Close')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
