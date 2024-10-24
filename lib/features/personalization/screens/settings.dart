import 'package:ecom_store/common/widgets/appbar/appbar.dart';
import 'package:ecom_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:ecom_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

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
                const SizedBox(height: ecomSizes.spaceBtwnSections),


                ///User Profile Card
                //  ListTile(
                //    leading: ,
                //  )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
