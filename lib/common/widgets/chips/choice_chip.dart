import 'package:ecom_store/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:ecom_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class ecomChoiceChip extends StatelessWidget {
  const ecomChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = ecomHelperFunctions.getColor(text) != null;
    return ChoiceChip(
      label:  isColor ? const SizedBox() : Text(text),
      selected: selected,
      onSelected: onSelected,
      labelStyle: TextStyle(color: selected ? ecomColors.whiteColor : null),
      avatar: isColor ? ecomCircularContainer(width: 50, height: 50, bgColor: ecomHelperFunctions.getColor(text)!) : null,
      labelPadding: isColor ? const EdgeInsets.all(0) : null,

      // Make Check Icon Centered
      shape: isColor ? const CircleBorder() : null,
      padding: isColor ?  const EdgeInsets.all(0) : null,
      backgroundColor:  isColor ? ecomHelperFunctions.getColor(text)! : null,
    );
  }
}
