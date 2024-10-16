import 'package:ecom_store/common/widgets/appbar/appbar.dart';
import 'package:ecom_store/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/products/cart/cart_menu_icon.dart';
import 'home_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ecomPrimaryHeaderContainer(
              child: Column(
                children: [
                  ecomHomeAppBar(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


