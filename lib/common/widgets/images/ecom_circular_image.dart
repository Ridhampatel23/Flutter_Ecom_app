import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecom_store/common/widgets/shimmers/shimmer.dart';
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
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: dark ? ecomColors.blackColor : ecomColors.whiteColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
          child: isNetworkImage
              ? CachedNetworkImage(
                  fit: fit,
                  color: overlayColor,
                  imageUrl: image,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      const ecomShimmerEffect(width: 55, height: 55, radius: 55),
                  errorWidget: (context, url, downloadProgress) =>
                      const Icon(Icons.error),
                )
              : Image(
                  image: AssetImage(image),
                  fit: fit,
                  color: overlayColor,
                ),
        ),
      ),
    );
  }
}
