import 'package:ecom_store/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class ecomShadowStyle{
  static final verticalProductShadow = BoxShadow(
    color: ecomColors.darkGreyColor.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );static final horizontalProductShadow = BoxShadow(
    color: ecomColors.darkGreyColor.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );


}