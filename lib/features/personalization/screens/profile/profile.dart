import 'package:ecom_store/common/widgets/appbar/appbar.dart';
import 'package:ecom_store/common/widgets/icons/ecom_circular_icon.dart';
import 'package:ecom_store/common/widgets/texts/section_heading.dart';
import 'package:ecom_store/features/personalization/screens/profile/widget/profile_menu.dart';
import 'package:ecom_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ecomAppBar(showBackArrow: true, title: Text("Profile")),

      ///Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ecomSizes.defaultSpace),
          child: Column(
            children: [
              ///Profile Card
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const ecomCircularIcon(
                        icon: Iconsax.user, width: 80, height: 80),
                    TextButton(
                        onPressed: () {},
                        child: const Text("Change Profile Picture")),
                  ],
                ),
              ),

              ///Details
              const SizedBox(height: ecomSizes.spaceBtwnItems / 2),
              const Divider(),
              const SizedBox(height: ecomSizes.spaceBtwnItems),

              ///Heading : Profile Info
              const ecomSectionHeading(
                  title: "Profile Information", showActionButton: false),
              const SizedBox(height: ecomSizes.spaceBtwnItems),

              ecomProfileMenu(
                  onPressed: () {}, title: 'Name', value: 'User 1234'),
              ecomProfileMenu(
                  onPressed: () {}, title: "Username", value: "User_1234"),

              const SizedBox(height: ecomSizes.spaceBtwnItems / 2),
              const Divider(),
              const SizedBox(height: ecomSizes.spaceBtwnItems),

              ///Heading : Personal Info
              const ecomSectionHeading(
                  title: "Personal Information", showActionButton: false),
              const SizedBox(height: ecomSizes.spaceBtwnItems),

              ecomProfileMenu(
                  onPressed: () {},
                  title: "User ID",
                  value: "12345",
                  icon: Iconsax.copy),
              ecomProfileMenu(
                  onPressed: () {},
                  title: "E-mail",
                  value: "user123@gmail.com"),
              ecomProfileMenu(
                  onPressed: () {},
                  title: "Phone Number",
                  value: "123-456-7890"),
              ecomProfileMenu(onPressed: () {}, title: "Gender", value: "Male"),
              ecomProfileMenu(
                  onPressed: () {},
                  title: "Date Of Birth",
                  value: "15 Dec, 2045"),
              const Divider(),
              const SizedBox(height: ecomSizes.spaceBtwnItems),

              ///Delete Account Button
              Center(
                child: ElevatedButton(
                  style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.red),),
                    onPressed: () {},
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        "Delete Account",
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
