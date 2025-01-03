import 'package:ecom_store/common/widgets/images/ecom_circular_image.dart';
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
    this.isNetworkImage = true,
  });

  final String image, title;
  final Color textColor;
  final Color? bgColor;
  final void Function()? onTap;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: ecomSizes.spaceBtwnItems),
        child: Column(
          children: [
            ///Circular Images
            ecomCircularImage(
              padding: ecomSizes.small * 1.4,
              image: image,
              isNetworkImage: isNetworkImage,
              bgColor: bgColor,
              overlayColor: ecomHelperFunctions.isDarkMode(context) ? ecomColors.light : ecomColors.dark,
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
