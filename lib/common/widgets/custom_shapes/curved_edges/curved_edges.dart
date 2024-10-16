import 'package:flutter/material.dart';

class ecomCustomCurvedEdges extends CustomClipper<Path>{
  @override
  ///Size represents the size of the children
  ///in which we are going to use the path
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);

    ///size.height points to the bottom of the child container,
    ///we are using - 20 because we want to start the curve a little
    ///higher than the bottom point
    final firstCurveFirstPoint = Offset(0, size.height - 20);
    final firsCurveSecondPoint = Offset(30, size.height - 20);
    path.quadraticBezierTo(firstCurveFirstPoint.dx, firstCurveFirstPoint.dy, firsCurveSecondPoint.dx , firsCurveSecondPoint.dy);

    //The x here has the value 0 as it starts from the last ended path
    //which will be the lastpoint.dx
    final secondCurveFirstPoint = Offset(0, size.height-20);
    final secondCurveSecondPoint = Offset(size.width - 30, size.height-20);
    path.quadraticBezierTo(secondCurveFirstPoint.dx, secondCurveFirstPoint.dy, secondCurveSecondPoint.dx, secondCurveSecondPoint.dy);

    final thirdCurveFirstPoint = Offset(size.width, size.height - 20);
    final thirdCurveSecondPoint = Offset(size.width, size.height);
    path.quadraticBezierTo(thirdCurveFirstPoint.dx, thirdCurveFirstPoint.dy, thirdCurveSecondPoint.dx , thirdCurveSecondPoint.dy);


    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}