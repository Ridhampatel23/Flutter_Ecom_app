import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../curved_edges/curved_edges_widget.dart';
import 'circular_container.dart';

class ecomPrimaryHeaderContainer extends StatelessWidget {
  const ecomPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ecomCurvedEdgesWidget(
      child: Container(
        color: ecomColors.primaryColor,
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            ///If you keep two positioned elemets in a stack wiTHOUT ANY OTHER WIDGETS, IT IS GOING TO THROW AN ERROR.
            Positioned(
                top: -150,
                right: -250,
                child: ecomCircularContainer(
                    bgColor: ecomColors.textWhite.withOpacity(0.1))),
            Positioned(
                top: 100,
                right: -300,
                child: ecomCircularContainer(
                    bgColor: ecomColors.textWhite.withOpacity(0.1))),
            child,
          ],
        ),
      ),
    );
  }
}
