import 'package:ecom_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class ecomCircularImage extends StatelessWidget {
  const ecomCircularImage({
    super.key,
    this.fit = BoxFit.contain,
    required this.image,
    this.isNetworkImage = false,
    this.overlayColor,
    this.bgColor,
    this.width = 56,
    this.height = 56,
    this.padding = ecomSizes.small,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? bgColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    final dark = ecomHelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      padding:  EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: dark ? ecomColors.blackColor : ecomColors.whiteColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Image(
          fit: fit,
          image: isNetworkImage? NetworkImage(image) : AssetImage(image) as ImageProvider,
          color: overlayColor,
        ),
      ),
    );
  }
}
