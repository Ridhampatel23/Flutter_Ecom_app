import 'package:ecom_store/common/widgets/appbar/appbar.dart';
import 'package:ecom_store/common/widgets/icons/ecom_circular_icon.dart';
import 'package:ecom_store/common/widgets/layouts/grid_layout.dart';
import 'package:ecom_store/common/widgets/loaders/animation_loader.dart';
import 'package:ecom_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ecom_store/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:ecom_store/features/shop/controllers/product/favourites_controller.dart';
import 'package:ecom_store/features/shop/screens/home/home.dart';
import 'package:ecom_store/navigation_menu.dart';
import 'package:ecom_store/utils/constants/images_strings.dart';
import 'package:ecom_store/utils/constants/sizes.dart';
import 'package:ecom_store/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../models/product_model.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<FavouritesController>()) {
      Get.put(FavouritesController());
    }
    final controller = FavouritesController.instance;

    return Scaffold(
      appBar: ecomAppBar(
        title:
            Text("Wishlist", style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          ecomCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(const HomeScreen()),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ecomSizes.defaultSpace),
          child: Column(
            children: [
              Obx(
              () => FutureBuilder(
                    future: controller.favouriteProducts(),
                    builder: (context, snapshot) {
                      final emptyWidget = ecomAnimationLoaderWidget(
                        text: 'Whoops! Wishlist is Empty...',
                        animation: ecomImages.decoderAnimation,
                        showAction: true,
                        actionText: 'Let\'s add Some',
                        onActionPressed: () =>
                            Get.off(() => const NavigationMenu()),
                      );

                       const loader = ecomVerticalProductShimmer(itemCount: 6);
                      final widget =
                          ecomCloudHelperFunctions.checkMultiRecordState(
                              snapshot: snapshot,
                              loader: loader,
                              nothingFound: emptyWidget);
                      if (widget != null) return widget;

                      final products = snapshot.data!;

                      return ecomGridLayout(
                          itemCount: products.length,
                          itemBuilder: (_, index) => ecomProductCardVertical(
                              product: ProductModel.empty()));
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
