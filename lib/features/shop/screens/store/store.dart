import 'package:ecom_store/common/widgets/appbar/appbar.dart';
import 'package:ecom_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecom_store/common/widgets/custom_shapes/containers/seach_container.dart';
import 'package:ecom_store/common/widgets/layouts/grid_layout.dart';
import 'package:ecom_store/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:ecom_store/common/widgets/texts/section_heading.dart';
import 'package:ecom_store/utils/constants/colors.dart';
import 'package:ecom_store/utils/constants/images_strings.dart';
import 'package:ecom_store/utils/constants/sizes.dart';
import 'package:ecom_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/images/ecom_circular_image.dart';
import '../../../../common/widgets/texts/ecom_brand_title_text_with_verified_icon.dart';
import '../../../../utils/constants/enums.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ecomHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: ecomAppBar(
        title: Text(
          "Store",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          ecomCartCounterIcon(onPressed: () {}),
        ],
      ),
      body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrollable) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor:
                    dark ? ecomColors.blackColor : ecomColors.whiteColor,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(ecomSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      /// -- Search Bar
                      const SizedBox(height: ecomSizes.spaceBtwnItems),
                      const ecomSearchContainer(
                          text: "Search in store",
                          showBorder: true,
                          showBG: false,
                          padding: EdgeInsets.zero),
                      const SizedBox(height: ecomSizes.spaceBtwnSections),

                      /// -- Featured Brands
                      ecomSectionHeading(
                          title: "Featured Brands", onPressed: () {}),
                      const SizedBox(height: ecomSizes.spaceBtwnSections / 1.5),

                      ecomGridLayout(
                          itemCount: 4,
                          mainAxisExtent: 80,
                          itemBuilder: (_, index) {
                            return GestureDetector(
                              onTap: () {},
                              child: ecomRoundedContainer(
                                padding: const EdgeInsets.all(ecomSizes.small),
                                showBorder: true,
                                bgColor: Colors.transparent,
                                child: Row(
                                  children: [
                                    /// -- Icon
                                    Flexible(
                                      child: ecomCircularImage(
                                        image: ecomImages.clothingIcon,
                                        bgColor: Colors.transparent,
                                        overlayColor: ecomHelperFunctions
                                                .isDarkMode(context)
                                            ? ecomColors.whiteColor
                                            : ecomColors.blackColor,
                                      ),
                                    ),
                                    const SizedBox(
                                        width: ecomSizes.spaceBtwnItems / 2),

                                    /// --Text
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const ecomBranTitleWithVerifiedIcon(
                                              title: 'Nike',
                                              brandTextSize: TextSizes.large),
                                          Text(
                                            "256 Products",
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: Container()),
    );
  }
}
