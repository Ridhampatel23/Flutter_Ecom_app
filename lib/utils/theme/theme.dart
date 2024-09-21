import 'package:ecom_store/utils/theme/custom_themes/appbar_theme.dart';
import 'package:ecom_store/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:ecom_store/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:ecom_store/utils/theme/custom_themes/chip_theme.dart';
import 'package:ecom_store/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:ecom_store/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:ecom_store/utils/theme/custom_themes/text_field_theme.dart';
import 'package:ecom_store/utils/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class mainAppTheme {
  mainAppTheme._();

  static ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    chipTheme: ecomChipTheme.lightChipTheme,
    appBarTheme: ecomAppBarTheme.lightAppBarTheme,
    checkboxTheme: ecomCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: ecomBottomSheetTheme.lightBottomSheet,
    outlinedButtonTheme: ecomOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: ecomTextFormFieldTheme.lightInputDecorationTheme,
    scaffoldBackgroundColor: Colors.white,
    textTheme: ecomTextTheme.lightTextTheme,
    elevatedButtonTheme: ecomElevatedButtonTheme.LightElevatedButton,
  );

  static ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: ecomTextTheme.darkTextTheme,
    elevatedButtonTheme: ecomElevatedButtonTheme.darkElevatedButton,
    outlinedButtonTheme: ecomOutlinedButtonTheme.darkOutlinedButtonTheme,
    chipTheme: ecomChipTheme.darkChipTheme,
    checkboxTheme: ecomCheckboxTheme.darkCheckboxTheme,
    appBarTheme: ecomAppBarTheme.darkAppBarTheme,
    inputDecorationTheme: ecomTextFormFieldTheme.darkInputDecorationTheme,
    bottomSheetTheme: ecomBottomSheetTheme.darkBottomSheet,
  );
}