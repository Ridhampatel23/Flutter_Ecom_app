
import 'package:ecom_store/common/widgets/shimmers/shimmer.dart';
import 'package:ecom_store/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';

class ecomListTileShimmer extends StatelessWidget {
  const ecomListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            ecomShimmerEffect(width: 50, height: 50, radius: 50),
            SizedBox(width: ecomSizes.spaceBtwnItems),
            Column(
              children: [
                ecomShimmerEffect(width: 100, height: 15),
                SizedBox(height: ecomSizes.spaceBtwnItems),
                ecomShimmerEffect(width: 80, height: 22),
              ],
            )
          ],
        )
      ],
    );
  }
}
