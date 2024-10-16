import 'package:flutter/material.dart';

import '../../../../../utils/constants/images_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class ecomLoginHeader extends StatelessWidget {
  const ecomLoginHeader({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipOval(
          child: Image(
            height: 150,
            image: AssetImage(dark
                ? ecomImages.lightAppLogo
                : ecomImages.darkAppLogo),
          ),
        ),
        Text("Welcome Back",
            style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: ecomSizes.small),
        Text("Please go ahead and log in",
            style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}