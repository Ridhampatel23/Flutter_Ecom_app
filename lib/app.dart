import 'package:ecom_store/bindings/general_bindings.dart';
import 'package:ecom_store/features/authentication/screens/onboarding/onboarding.dart';
import 'package:ecom_store/utils/constants/colors.dart';
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
      initialBinding: GeneralBindings(),
      color: Colors.white,

      /// Show Loader or Circular progress indicator while Authentication Repository is decing the relevant screen to be shown.
      home: const Scaffold(
        backgroundColor: ecomColors.primaryColor,
        body: Center(child: CircularProgressIndicator(color: ecomColors.whiteColor),),
      ),
    );
  }
}

