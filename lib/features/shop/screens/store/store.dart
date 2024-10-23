import 'package:ecom_store/common/widgets/appbar/appbar.dart';
import 'package:ecom_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecom_store/common/widgets/custom_shapes/containers/seach_container.dart';
import 'package:ecom_store/common/widgets/layouts/grid_layout.dart';
import 'package:ecom_store/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:ecom_store/common/widgets/texts/section_heading.dart';
import 'package:ecom_store/features/shop/screens/store/widgets/category_tab.dart';
import 'package:ecom_store/utils/constants/colors.dart';
import 'package:ecom_store/utils/constants/images_strings.dart';
import 'package:ecom_store/utils/constants/sizes.dart';
import 'package:ecom_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar/tabbar.dart';
import '../../../../common/widgets/brands/brand_showcase.dart';
import '../../../../common/widgets/images/ecom_circular_image.dart';
import '../../../../common/widgets/brands/brand_card.dart';
import '../../../../common/widgets/texts/ecom_brand_title_text_with_verified_icon.dart';
import '../../../../utils/constants/enums.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ecomHelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
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
                        const SizedBox(
                            height: ecomSizes.spaceBtwnSections / 1.5),

                        /// -- Brands Grid
                        ecomGridLayout(
                            itemCount: 4,
                            mainAxisExtent: 80,
                            itemBuilder: (_, index) {
                              return ecomBrandCard();
                            }),
                      ],
                    ),
                  ),

                  /// -- Tabs --
                  ///  keep in mind that you need to wrap the Scaffold (the main widget)
                  ///  with a default tab widget or else the screen will show and error.

                  bottom: const ecomTabBar(
                    tabs: [
                      Tab(child: Text("Sports")),
                      Tab(child: Text("Furniture")),
                      Tab(child: Text("Electronics")),
                      Tab(child: Text("Clothes")),
                      Tab(child: Text("Cosmetics")),
                    ],
                  ),
                ),
              ];
            },
            body: const TabBarView(
              ///TODO : In the Future once we configure the backend, we will try to
              ///map each category with their own data and change the products.
              children: [
                ecomCategoryTab(),
                ecomCategoryTab(),
                ecomCategoryTab(),
                ecomCategoryTab(),
                ecomCategoryTab(),
              ],
            )),
      ),
    );
  }
}
