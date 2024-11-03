import 'package:ecom_store/common/widgets/appbar/appbar.dart';
import 'package:ecom_store/features/personalization/screens/address/add_new_address.dart';
import 'package:ecom_store/features/personalization/screens/address/widgets/single_address.dart';
import 'package:ecom_store/utils/constants/colors.dart';
import 'package:ecom_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        backgroundColor: ecomColors.primaryColor,
        child: const Icon(Iconsax.add, color: Colors.white),
      ),
      appBar: ecomAppBar(
        showBackArrow: true,
        title:
            Text("Addresses", style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ecomSizes.defaultSpace),
          child: Column(
            children: [
              ecomSingleAddress(selectedAdress: true),
              ecomSingleAddress(selectedAdress: false),
              ecomSingleAddress(selectedAdress: false),

            ],
          ),
        ),
      ),
    );
  }
}
