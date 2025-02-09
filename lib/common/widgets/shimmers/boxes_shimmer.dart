
import 'package:ecom_store/common/widgets/shimmers/shimmer.dart';
import 'package:ecom_store/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';

class ecomBoxesShimmer extends StatelessWidget {
  const ecomBoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: ecomShimmerEffect(width: 150, height: 110)),
            SizedBox(width: ecomSizes.spaceBtwnItems),
            Expanded(child: ecomShimmerEffect(width: 150, height: 110)),
            SizedBox(width: ecomSizes.spaceBtwnItems),
            Expanded(child: ecomShimmerEffect(width: 150, height: 110)),
          ],
        )
      ],
    );
  }
}
