import 'package:flutter/material.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../utils/constants/colors.dart';

class ecomHomeAppBar extends StatelessWidget {
  const ecomHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ecomAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Good day for shopping',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: ecomColors.greyColor)),
          Text('Hello, World',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: ecomColors.whiteColor)),
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
