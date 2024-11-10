import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../custom_shapes/containers/rounded_container.dart';

class ecomCouponCode extends StatelessWidget {
  const ecomCouponCode({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    final dark = ecomHelperFunctions.isDarkMode(context);
    return ecomRoundedContainer(
        showBorder: true,
        bgColor: ecomHelperFunctions.isDarkMode(context)
            ? ecomColors.dark
            : ecomColors.whiteColor,
        padding: const EdgeInsets.only(
            top: ecomSizes.small,
            bottom: ecomSizes.small,
            right: ecomSizes.small,
            left: ecomSizes.medium),
        child: Row(
          children: [
            Flexible(
              child: TextFormField(
                decoration: const InputDecoration(
                    hintText: "Have a promo code? Enter here",
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    border: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none),
              ),
            ),
            SizedBox(
              width: 80,
              child: ElevatedButton(
                onPressed: () {},
                //we use style from to keep all the other styles but change a few
                style: ElevatedButton.styleFrom(
                  foregroundColor: dark ? ecomColors.whiteColor.withOpacity(0.5) : ecomColors.dark.withOpacity(0.5),
                  backgroundColor: ecomColors.greyColor.withOpacity(0.2),
                  side: BorderSide(color: ecomColors.greyColor.withOpacity(0.1)),
                ),
                child: const Text("Apply"),
              ),
            ),
          ],
        ));
  }
}
