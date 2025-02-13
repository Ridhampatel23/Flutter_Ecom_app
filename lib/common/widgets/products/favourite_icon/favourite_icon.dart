import 'package:ecom_store/utils/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/controllers/product/favourites_controller.dart';
import '../../icons/ecom_circular_icon.dart';

class ecomFavouriteIcon extends StatelessWidget {
  const ecomFavouriteIcon({
    super.key, required this.productId,
  });

  final String productId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouritesController());
    return Obx(
      () => ecomCircularIcon(icon: controller.isFavourite(productId) ? Iconsax.heart5 : Iconsax.heart, color: controller.isFavourite(productId) ? ecomColors.errorColor : null,
      onPressed: () => controller.toggleFavouriteProduct(productId),
      ),
    );
  }
}
