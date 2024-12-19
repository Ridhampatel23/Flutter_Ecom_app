import 'package:ecom_store/common/widgets/shimmers/shimmer.dart';
import 'package:ecom_store/features/personalization/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../utils/constants/colors.dart';

class ecomHomeAppBar extends StatelessWidget {
  const ecomHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return ecomAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Good day for shopping',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: ecomColors.greyColor)),
          Obx(() {
            if (controller.profileLoader.value) {
              // Display a loader while the profile is being fetched
              return const ecomShimmerEffect(width: 80, height: 15);
            } else {
              return Text(controller.user.value.fullName,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .apply(color: ecomColors.whiteColor));
            }
          }),
        ],
      ),
      actions: [
        ecomCartCounterIcon(
          onPressed: () {},
          iconColor: ecomColors.whiteColor,
        )
      ],
    );
  }
}
