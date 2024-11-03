import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';

class ecomRatingBarIndicator extends StatelessWidget {
  const ecomRatingBarIndicator({
    super.key, required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      itemBuilder: (_, __) => const Icon(Iconsax.star1, color: ecomColors.primaryColor),
      onRatingUpdate: (value) {},
      initialRating: rating,
      ignoreGestures: true,
      allowHalfRating: true,
      itemSize: 20,
      unratedColor: Colors.grey,
    );
  }
}
