import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';

class ecomCircularContainer extends StatelessWidget {
  const ecomCircularContainer({
    ///These are all the default values below, you can change them when you use cricular contianer by simply pressing
    ///control + spaceBar and stating the paramter's value.
    super.key,this.child, this.width = 400, this.height = 400, this.radius = 400, this.padding = 0,  this.bgColor = ecomColors.whiteColor, this.margin,
  });

  final double? width;
  final double? height;
  final double radius;
  final EdgeInsets? margin;
  final double padding;
  final Widget? child;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding:  EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: bgColor,
      ),
      child: child,
    );
  }
}