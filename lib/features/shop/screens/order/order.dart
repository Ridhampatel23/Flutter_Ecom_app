import 'package:ecom_store/common/widgets/appbar/appbar.dart';
import 'package:ecom_store/features/shop/screens/order/widgets/order_lists.dart';
import 'package:ecom_store/utils/constants/sizes.dart';
import 'package:ecom_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ecomHelperFunctions.isDarkMode(context);
    return Scaffold(
      /// -- Appbar
      appBar: ecomAppBar(
        title: Text("My Orders", style: Theme.of(context).textTheme.headlineSmall), showBackArrow: true,
      ),

      body: const Padding(padding: EdgeInsets.all(ecomSizes.defaultSpace),

        /// -- Orders
        child: ecomOrderListItems(),
      ),
    );
  }
}
