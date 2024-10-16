import 'package:flutter/material.dart';

import 'curved_edges.dart';


class ecomCurvedEdgesWidget extends StatelessWidget {
  const ecomCurvedEdgesWidget({
    super.key, this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ecomCustomCurvedEdges() ,
      child: child,
    );
  }
}
