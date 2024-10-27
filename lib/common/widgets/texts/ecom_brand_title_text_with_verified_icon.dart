import 'package:ecom_store/common/widgets/texts/ecom_brand_title_text.dart';
import 'package:ecom_store/utils/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class ecomBrandTitleWithVerifiedIcon extends StatelessWidget {
  const ecomBrandTitleWithVerifiedIcon({
    super.key, required this.title, this.maxLines = 1, this.textColor , this.iconColor = ecomColors.primaryColor, this.textAlign = TextAlign.center, this.brandTextSize = TextSizes.small,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ecomBrandTitleText(title: title,
        color: textColor,
          maxLines: maxLines,
          textAlign: textAlign,
          brandTextSize: brandTextSize,
        ),
        const SizedBox(width: ecomSizes.xsmall),
        Icon(Iconsax.verify5, color: iconColor, size: ecomSizes.medium),

      ],
    );
  }
}
