import 'package:ecom_store/common/widgets/appbar/appbar.dart';
import 'package:ecom_store/features/shop/screens/product_reviews/widgets/overall_rating_progress_indicator.dart';
import 'package:ecom_store/common/widgets/products/ratings/rating_bar_indicator.dart';
import 'package:ecom_store/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:ecom_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// -- Appbar
      appBar: const ecomAppBar(
          title: Text("Reviews and Ratings"), showBackArrow: true),

      /// -- Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ecomSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  "Ratings and Reviews are verified and are from people who use the same type of device as you."),
              const SizedBox(height: ecomSizes.spaceBtwnItems),

              ///Overall Product Ratings
              const ecomOverallProductRatings(),
              const ecomRatingBarIndicator(rating: 3.5),
              Text("20,000", style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: ecomSizes.spaceBtwnSections),

              /// User Reviews List
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}

