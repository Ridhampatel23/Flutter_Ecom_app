import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class ecomFormDivider extends StatelessWidget {
  const ecomFormDivider({
    super.key,
    required this.dark, required this.dividerText,
  });

  final String dividerText;

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
              color: dark
                  ? ecomColors.lightGreyColor
                  : ecomColors.darkGreyColor,
              thickness: 1,
              indent: 10,
              endIndent: 1),
        ),
        Text(dividerText,
            style: Theme.of(context).textTheme.labelMedium),
        Flexible(
          child: Divider(
              color: dark
                  ? ecomColors.lightGreyColor
                  : ecomColors.darkGreyColor,
              thickness: 1,
              indent: 1,
              endIndent: 10),
        ),
      ],
    );
  }
}
