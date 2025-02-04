
import 'package:ecom_store/common/widgets/layouts/grid_layout.dart';
import 'package:ecom_store/common/widgets/shimmers/shimmer.dart';
import 'package:flutter/cupertino.dart';

class ecomBrandsShimmer extends StatelessWidget {
  const ecomBrandsShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ecomGridLayout(itemCount: itemCount, itemBuilder: (_,__) => const ecomShimmerEffect(width: 300, height: 80));
  }
}
