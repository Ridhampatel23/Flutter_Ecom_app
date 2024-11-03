import 'package:ecom_store/common/widgets/appbar/appbar.dart';
import 'package:ecom_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:ecom_store/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:ecom_store/common/widgets/texts/section_heading.dart';
import 'package:ecom_store/features/personalization/screens/address/address.dart';
import 'package:ecom_store/features/personalization/screens/profile/profile.dart';
import 'package:ecom_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/list_tiles/user_profile_tile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///Header

            ecomPrimaryHeaderContainer(
              child: Column(
                children: [
                  //If you use a simple text widget here , the container won't
                  //render properly i.e. wont take the full width as it is inside a Column,
                  // so wwe are going to use our custom AppBar which has the title option
                  // Inside of it which will take up the entire width.
                  ecomAppBar(
                    title: Text(
                      "Account",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: Colors.white),
                    ),
                  ),

                  ///User Profile Card
                  ecomUserProfileTile(onPressed: (() => Get.to(const ProfileScreen()))),
                  const SizedBox(height: ecomSizes.spaceBtwnSections),
                ],
              ),
            ),

            /// -- Body
            Padding(
              padding: const EdgeInsets.all(ecomSizes.defaultSpace),
              child: Column(
                children: [
                  ///Account Settings
                  const ecomSectionHeading(
                      title: "Account Settings", showActionButton: false),
                  const SizedBox(height: ecomSizes.spaceBtwnItems),

                  ecomSettingsMenuTile(
                      icon: Iconsax.safe_home,
                      title: "My Address",
                      subTitle: "Change Shipping / Delivery Address",
                      onTap: () {}),
                  ecomSettingsMenuTile(
                      icon: Iconsax.shopping_cart,
                      title: "My Cart",
                      subTitle: "Add, Remove products and move to Checkout",
                      onTap: () => Get.to(() => const UserAddressScreen())),
                  ecomSettingsMenuTile(
                      icon: Iconsax.bag_tick,
                      title: "My Orders",
                      subTitle: "Check your In-progress / Completed orders",
                      onTap: () {}),
                  ecomSettingsMenuTile(
                      icon: Iconsax.bank,
                      title: "Link to Bank Account",
                      subTitle: "Withdraw Balance to registered bank account",
                      onTap: () {}),
                  ecomSettingsMenuTile(
                      icon: Iconsax.discount_shape,
                      title: "My Coupons",
                      subTitle: "List of all the discount coupons",
                      onTap: () {}),
                  ecomSettingsMenuTile(
                      icon: Iconsax.notification,
                      title: "Notifications",
                      subTitle: "Turn on push notifications",
                      onTap: () {}),
                  ecomSettingsMenuTile(
                      icon: Iconsax.security_card,
                      title: "Account Privacy",
                      subTitle: "Manage data usage and connected accounts",
                      onTap: () {}),

                  const SizedBox(height: ecomSizes.spaceBtwnSections),

                  /// -- App Settings
                  const ecomSectionHeading(
                      title: "App Settings", showActionButton: false),
                  const SizedBox(height: ecomSizes.spaceBtwnItems),
                  ecomSettingsMenuTile(
                      icon: Iconsax.document_upload,
                      title: "Load Data",
                      subTitle: "Upload your data to Firebase Cloud",
                      onTap: () {}),
                  ecomSettingsMenuTile(
                    icon: Iconsax.location,
                    title: "Location",
                    subTitle: "Allow App to track location",
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  ecomSettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: "Safe Mode",
                    subTitle: "Search results safe for all ages",
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  ecomSettingsMenuTile(
                    icon: Iconsax.image,
                    title: "HD Image Quality",
                    subTitle: "Set Image Quality",
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  const SizedBox(height: ecomSizes.spaceBtwnSections),
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: OutlinedButton(onPressed: () {}, child: const Text("Logout")),
                  ),
                  const SizedBox(height: ecomSizes.spaceBtwnSections * 2.5),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
