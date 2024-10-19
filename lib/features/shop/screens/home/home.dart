import 'package:ecom_store/features/shop/screens/home/widgets/home_categories.dart';
import 'package:ecom_store/utils/constants/colors.dart';
import 'package:ecom_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/seach_container.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import 'widgets/home_appbar.dart';

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
                  ///AppBar
                  ecomHomeAppBar(),
                  SizedBox(height: ecomSizes.spaceBtwnSections),

                  ///Search Bar
                  ecomSearchContainer(text: 'Search in store'),
                  SizedBox(height: ecomSizes.spaceBtwnSections),

                  Padding(
                    padding:
                        EdgeInsets.only(left: ecomSizes.defaultSpace),
                    child: Column(
                      children: [
                        /// -- Heading --

                        ecomSectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: ecomColors.whiteColor,
                        ),
                        SizedBox(height: ecomSizes.spaceBtwnItems),

                        /// ---Caregories ---
                        ecomHomeCategories(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


