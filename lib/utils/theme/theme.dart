import 'package:ecom_store/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:ecom_store/utils/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class mainAppTheme {
  mainAppTheme._();

  static ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: Colors.blue,
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

  );
}