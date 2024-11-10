import 'package:ecom_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecom_store/common/widgets/success_screen/success_screen.dart';
import 'package:ecom_store/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:ecom_store/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:ecom_store/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:ecom_store/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:ecom_store/navigation_menu.dart';
import 'package:ecom_store/utils/constants/colors.dart';
import 'package:ecom_store/utils/constants/images_strings.dart';
import 'package:ecom_store/utils/constants/sizes.dart';
import 'package:ecom_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products/cart/coupon_widget.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ecomHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: ecomAppBar(
        showBackArrow: true,
        title: Text("Order Review",
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ecomSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Items in the cart
              const ecomCartItems(showAddRemoveButtons: false),
              const SizedBox(height: ecomSizes.spaceBtwnSections),

              /// -- Coupons and Promo Codes
              const ecomCouponCode(),
              const SizedBox(height: ecomSizes.spaceBtwnSections),

              /// -- Billing Section
              ecomRoundedContainer(
                padding: const EdgeInsets.all(ecomSizes.medium),
                showBorder: true,
                bgColor: dark ? Colors.black : ecomColors.whiteColor,
                child: const Column(
                  children: [
                    /// Pricing
                    ecomBillingAmountSection(),
                    SizedBox(height: ecomSizes.spaceBtwnItems),

                    /// Divider
                    Divider(),
                    SizedBox(height: ecomSizes.spaceBtwnItems),

                    ///  Payment Methods
                    ecomBillingPaymentSection(),
                    SizedBox(height: ecomSizes.spaceBtwnItems),

                    ///  Address
                    ecomBillingAddressSection(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(ecomSizes.defaultSpace),
        child: SizedBox(
          height: 50,
          child: ElevatedButton(
              onPressed: () => Get.to(
                    () => SuccessScreen(
                      image: ecomImages.onBoardingImage3,
                      title: "Payment Success",
                      subTitle: "Your Item will be shipped soon!",
                      onPressed: () => Get.offAll(() => const NavigationMenu()),
                    ),
                  ),
              child: const Text("Checkout \$256.0")),
        ),
      ),
    );
  }
}
