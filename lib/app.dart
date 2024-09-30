import 'package:ecom_store/features/screens/onBoarding/onboarding.dart';
import 'package:ecom_store/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Use this class to setup themes, initial bindings , any animation and so on..
class Main_app extends StatelessWidget {
  const Main_app({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: mainAppTheme.light,
      darkTheme: mainAppTheme.dark,
      color: Colors.white,
      home: OnBoardingScreen() ,
    );
  }
}