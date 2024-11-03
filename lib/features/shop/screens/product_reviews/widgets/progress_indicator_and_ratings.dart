import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';

class ecomRatingProgressIndicator extends StatelessWidget {
  const ecomRatingProgressIndicator({
    super.key, required this.text, required this.value,
  });

  final String text;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text, style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(width: ecomSizes.spaceBtwnItems / 2),

        SizedBox(
          width: ecomDeviceUtils.getScreenWidth(context) * 0.5,
          child: LinearProgressIndicator(
            value: value,
            minHeight: 11,
            backgroundColor: Colors.grey,
            valueColor: const AlwaysStoppedAnimation(ecomColors.primaryColor),
            borderRadius: BorderRadius.circular(7),
          ),
        )
      ],
    );
  }
}
