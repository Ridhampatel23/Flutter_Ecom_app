import 'package:ecom_store/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:ecom_store/features/shop/screens/checkout/checkout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ecomHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: ecomAppBar(
        showBackArrow: true,
        title: Text("Cart", style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: const Padding(
        padding: EdgeInsets.all(ecomSizes.defaultSpace),
        child: ecomCartItems(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(ecomSizes.defaultSpace),
        child: SizedBox(height: 50, child: ElevatedButton(onPressed: () => Get.to(() => const CheckoutScreen()), child: const Text("Checkout \$256.0"))),
      ),
    );
  }
}
