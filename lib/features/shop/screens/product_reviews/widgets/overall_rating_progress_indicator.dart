import 'package:ecom_store/features/shop/screens/product_reviews/widgets/progress_indicator_and_ratings.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';

class ecomOverallProductRatings extends StatelessWidget {
  const ecomOverallProductRatings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("4.8", style: Theme.of(context).textTheme.displayLarge),
        const SizedBox(width: ecomSizes.spaceBtwnItems),
        const Column(
          children: [
            ecomRatingProgressIndicator(text: '5', value: 1.0),
            ecomRatingProgressIndicator(text: '4', value: 0.8),
            ecomRatingProgressIndicator(text: '3', value: 0.6),
            ecomRatingProgressIndicator(text: '2', value: 0.4),
            ecomRatingProgressIndicator(text: '1', value: 0.2),
          ],
        )
      ],
    );
  }
}
