import 'package:ecom_store/common/widgets/layouts/grid_layout.dart';
import 'package:ecom_store/common/widgets/shimmers/shimmer.dart';
import 'package:ecom_store/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';

class ecomVerticalProductShimmer extends StatelessWidget {
  const ecomVerticalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ecomGridLayout(
        itemCount: itemCount,
        itemBuilder: (_, __) => const SizedBox(
              width: 180,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Image
                  ecomShimmerEffect(width: 180, height: 180),
                  SizedBox(height: ecomSizes.spaceBtwnItems),

                  /// Text
                  ecomShimmerEffect(width: 160, height: 15),
                  SizedBox(height: ecomSizes.spaceBtwnItems / 2),
                  ecomShimmerEffect(width: 110, height: 15),
                ],
              ),
            ));
  }
}
