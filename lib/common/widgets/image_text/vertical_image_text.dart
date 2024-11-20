import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class ecomVerticalImageText extends StatelessWidget {
  const ecomVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = ecomColors.whiteColor,
    this.bgColor,
    this.onTap,
  });

  final String image, title;
  final Color textColor;
  final Color? bgColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: ecomSizes.spaceBtwnItems),
        child: Column(
          children: [
            ///Circular Images
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(ecomSizes.small),
              decoration: BoxDecoration(
                //The statement below means use a bgcolor if there is one specified
                //Otherwise use the isdarkmode function and use dark or white bg depending on the mode.
                color: bgColor ?? (ecomHelperFunctions.isDarkMode(context) ? ecomColors.blackColor : ecomColors.whiteColor),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Image(
                    image: AssetImage(image),
                    fit: BoxFit.contain,
                    color: ecomHelperFunctions.isDarkMode(context) ? ecomColors.blackColor : ecomColors.whiteColor),
              ),
            ),

            ///Text
            const SizedBox(height: ecomSizes.spaceBtwnItems / 2),

            //If the text is larger , it will take more space and shift the circular contianers
            //apart!
            SizedBox(
                width: 55,
                child: Text(title,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .apply(color: textColor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis)),
          ],
        ),
      ),
    );
  }
}
