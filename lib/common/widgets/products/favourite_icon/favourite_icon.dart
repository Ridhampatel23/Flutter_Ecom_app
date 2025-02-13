import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../icons/ecom_circular_icon.dart';

class ecomFavouriteIcon extends StatelessWidget {
  const ecomFavouriteIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouritesController);
    return const ecomCircularIcon(
        icon: Iconsax.heart5, color: Colors.red);
  }
}
