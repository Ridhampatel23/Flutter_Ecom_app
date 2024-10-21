import 'package:ecom_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';

class ecomCircularIcon extends StatelessWidget {
  /// A custom Circular Icon widget with a bg color
  ///
  /// properties are :
  /// Container [width], [height] &  [backgroundColor]
  ///
  /// Icon's [sizes], [color] & [onPressed]

  const ecomCircularIcon({
    super.key,
     this.width, this.height, this.size, required this.icon, this.color, this.bgColor, this.onPressed,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? color, bgColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: bgColor!= null ? bgColor!  : ecomHelperFunctions.isDarkMode(context) ? Colors.black.withOpacity(0.9) : ecomColors.whiteColor.withOpacity(0.9),
      ),
      child: IconButton(onPressed: onPressed , icon:  Icon(icon, color: color, size: size)),
    );
  }
}
