import 'package:ecom_store/common/widgets/appbar/appbar.dart';
import 'package:ecom_store/common/widgets/icons/ecom_circular_icon.dart';
import 'package:ecom_store/common/widgets/texts/section_heading.dart';
import 'package:ecom_store/data/repositories/user/user_repository.dart';
import 'package:ecom_store/features/personalization/controllers/user_controller.dart';
import 'package:ecom_store/features/personalization/screens/change_name/change_name_screen.dart';
import 'package:ecom_store/features/personalization/screens/profile/widget/profile_menu.dart';
import 'package:ecom_store/features/personalization/screens/profile/widget/re_authenticate_user_login_form.dart';
import 'package:ecom_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
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
                  onPressed: () => Get.to(() => const ChangeName()), title: 'Name', value: controller.user.value.fullName),
              ecomProfileMenu(
                  onPressed: () {}, title: "Username", value: controller.user.value.userName),

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
                  value: controller.user.value.id,
                  icon: Iconsax.copy),
              ecomProfileMenu(
                  onPressed: () {},
                  title: "E-mail",
                  value: controller.user.value.email),
              ecomProfileMenu(
                  onPressed: () {},
                  title: "Phone Number",
                  value: controller.user.value.phoneNumber),
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
                    onPressed: () => controller.deleteAccountWarningPopUp(),
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
