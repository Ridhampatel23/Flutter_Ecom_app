import 'package:ecom_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecom_store/common/widgets/products/ratings/rating_bar_indicator.dart';
import 'package:ecom_store/utils/constants/colors.dart';
import 'package:ecom_store/utils/constants/images_strings.dart';
import 'package:ecom_store/utils/constants/sizes.dart';
import 'package:ecom_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});



  @override
  Widget build(BuildContext context) {
    final dark = ecomHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(backgroundImage: AssetImage(ecomImages.clothingIcon)),
                const SizedBox(width: ecomSizes.spaceBtwnItems),
                Text("Klay Curry", style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        const SizedBox(height: ecomSizes.spaceBtwnItems),


        /// Reviews
        Row(
          children: [
            const ecomRatingBarIndicator(rating: 4),
            const SizedBox(width: ecomSizes.spaceBtwnItems),
            Text("01 Jan, 2024", style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: ecomSizes.spaceBtwnItems),

        const ReadMoreText("The User Interface pf the app is really intuitive, I was able to navigate and make purchases without any hassles. The Backend fetches data seamlessly as well. Great job! ",
        trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: "Show Less",
          lessStyle: TextStyle(fontWeight: FontWeight.bold, color: ecomColors.primaryColor),
          trimCollapsedText: "Show More",
          moreStyle: TextStyle(fontWeight: FontWeight.bold, color: ecomColors.primaryColor),
        ),
        const SizedBox(height: ecomSizes.spaceBtwnItems),

        ecomRoundedContainer(
          bgColor:  dark ? ecomColors.darkerGreyColor : ecomColors.greyColor,
          child: Padding(padding: const EdgeInsets.all(ecomSizes.medium),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Fly Buy", style: Theme.of(context).textTheme.titleMedium),
                  Text("01 Dec, 2024", style: Theme.of(context).textTheme.titleMedium),
                ],
              ),
              const SizedBox(height: ecomSizes.spaceBtwnItems),

              const ReadMoreText("The User Interface pf the app is really intuitive, I was able to navigate and make purchases without any hassles. The Backend fetches data seamlessly as well. Great job! ",
                trimLines: 2,
                trimMode: TrimMode.Line,
                trimExpandedText: "Show Less",
                lessStyle: TextStyle(fontWeight: FontWeight.bold, color: ecomColors.primaryColor),
                trimCollapsedText: "Show More",
                moreStyle: TextStyle(fontWeight: FontWeight.bold, color: ecomColors.primaryColor),
              ),
            ],
          ),
          ),
        ),
        const SizedBox(height: ecomSizes.spaceBtwnSections),
      ],
    );
  }
}
