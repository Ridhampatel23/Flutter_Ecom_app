import 'package:ecom_store/utils/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Main_app());
}

class Main_app extends StatelessWidget {
  const Main_app({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: mainAppTheme.light,
      darkTheme: mainAppTheme.dark,
      color: Colors.white,
       );
  }
}
