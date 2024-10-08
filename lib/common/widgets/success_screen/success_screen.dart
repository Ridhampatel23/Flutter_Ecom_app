import 'package:ecom_store/common/styles/spacing_styles.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle,
      this.onPressed});

  final String image, title, subTitle;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: ecomSpacingStyles.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              Image(
                image:   AssetImage(image),
                width: ecomHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: ecomSizes.spaceBtwnSections),

              ///Title and SubTitle
              Text(title,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: ecomSizes.spaceBtwnItems),
              Text( subTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: ecomSizes.spaceBtwnSections),

              SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: onPressed,
                      child: Text("Continue"))),
            ],
          ),
        ),
      ),
    );
  }
}
