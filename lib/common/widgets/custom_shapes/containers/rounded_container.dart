import 'package:ecom_store/utils/constants/colors.dart';
import 'package:ecom_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class ecomRoundedContainer extends StatelessWidget {
  const ecomRoundedContainer({super.key, this.width, this.height,this.radius = ecomSizes.cardRadiusLarge, this.child, this.showBorder = false, this.borderColor = ecomColors.borderPrimaryColor, this.bgColor = ecomColors.whiteColor, this.padding, this.margin});

  final double? width, height;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color borderColor;
  final Color bgColor;
  final EdgeInsetsGeometry? padding, margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}
