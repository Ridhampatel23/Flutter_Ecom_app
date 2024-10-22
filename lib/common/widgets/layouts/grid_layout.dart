import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';
import '../products/product_cards/product_card_vertical.dart';

class ecomGridLayout extends StatelessWidget {
  const ecomGridLayout({
    super.key, required this.itemCount, this.mainAxisExtent = 288, required this.itemBuilder,
  });

  final int itemCount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: ecomSizes.gridViewSpacing,
        crossAxisSpacing: ecomSizes.gridViewSpacing,
        mainAxisExtent: mainAxisExtent,
      ),

      itemBuilder: itemBuilder,
    );
  }
}
