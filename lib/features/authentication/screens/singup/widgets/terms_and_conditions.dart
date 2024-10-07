import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class ecomTermsAndConditions extends StatelessWidget {
  const ecomTermsAndConditions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = ecomHelperFunctions.isDarkMode(context);

    return Row(
      children: [
        SizedBox(
            width: 24,
            height: 24,
            child: Checkbox(value: true, onChanged: (value) {})),
        const SizedBox(width: ecomSizes.spaceBtwnItems),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: ("I agree to "),
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                  text: "Privacy Policy ",
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: dark
                            ? ecomColors.whiteColor
                            : ecomColors.primaryColor,
                        decoration: TextDecoration.underline,
                        decorationColor: dark
                            ? ecomColors.whiteColor
                            : ecomColors.primaryColor,
                      )),
              TextSpan(
                  text: ("and "), style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                text: "Terms of use",
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark
                          ? ecomColors.whiteColor
                          : ecomColors.primaryColor,
                      decoration: TextDecoration.underline,
                      decorationColor: dark
                          ? ecomColors.whiteColor
                          : ecomColors.primaryColor,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
