import 'package:ecom_store/common/widgets/appbar/appbar.dart';
import 'package:ecom_store/common/widgets/custom_shapes/containers/seach_container.dart';
import 'package:ecom_store/common/widgets/layouts/grid_layout.dart';
import 'package:ecom_store/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:ecom_store/common/widgets/shimmers/brands_shimmer.dart';
import 'package:ecom_store/common/widgets/texts/section_heading.dart';
import 'package:ecom_store/features/shop/controllers/brand_controller.dart';
import 'package:ecom_store/features/shop/controllers/category_controller.dart';
import 'package:ecom_store/features/shop/screens/brand/all_brands.dart';
import 'package:ecom_store/features/shop/screens/brand/brand_products.dart';
import 'package:ecom_store/features/shop/screens/store/widgets/category_tab.dart';
import 'package:ecom_store/utils/constants/colors.dart';
import 'package:ecom_store/utils/constants/sizes.dart';
import 'package:ecom_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/tabbar.dart';
import '../../../../common/widgets/brands/brand_card.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // We create or find a new instance of BrandController to trigger the on init function of the controller.
    final brandController = Get.put(BrandController());
    final categoryController = CategoryController.instance.featuredCategories;
    final dark = ecomHelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: categoryController.length,
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
                            title: "Featured Brands", onPressed: () => Get.to(() => const AllBrandsScreen())),
                        const SizedBox(
                            height: ecomSizes.spaceBtwnSections / 1.5),

                        /// -- Brands Grid
                        Obx(
                            () {
                              if(brandController.isLoading.value) return const ecomBrandsShimmer();

                              if(brandController.featureBrands.isEmpty){
                                return Center(
                                  child: Text('No Data Found', style: Theme.of(context).textTheme.bodyMedium!.apply(color: ecomColors.whiteColor)),
                                );
                              }

                              return  ecomGridLayout(
                                  itemCount: brandController.featureBrands.length,
                                  mainAxisExtent: 80,
                                  itemBuilder: (_, index) {
                                    final brand = brandController.featureBrands[index];
                                    return ecomBrandCard(showBorder: true, brand: brand, onTap: () => Get.to(() => BrandProducts(brand: brand)));
                                  });
                            }
                        ),
                      ],
                    ),
                  ),

                  /// -- Tabs --
                  ///  keep in mind that you need to wrap the Scaffold (the main widget)
                  ///  with a default tab widget or else the screen will show and error.

                  bottom: ecomTabBar(
                    tabs: categoryController.map((category) => Tab(child: Text(category.name))).toList(),
                  ),
                ),
              ];
            },
            body: TabBarView(
              ///TODO : In the Future once we configure the backend, we will try to
              ///map each category with their own data and change the products.
              children: categoryController.map((category) => ecomCategoryTab(category : category)).toList(),

            )),
      ),
    );
  }
}
