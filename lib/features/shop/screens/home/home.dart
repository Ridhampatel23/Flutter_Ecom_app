import 'package:ecom_store/utils/constants/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/custom_shapes/containers/circular_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: ecomColors.primaryColor,
              padding: const EdgeInsets.all(0),
              child: SizedBox(
                height: 400,
                child: Stack(
                  children: [
                    ///If you keep two positioned elemets in a stack wiTHOUT ANY OTHER WIDGETS, IT IS GOING TO THROW AN ERROR.
                   Positioned(top: -150,right: -250,  child: ecomCircularContainer(bgColor: ecomColors.textWhite.withOpacity(0.1))),
                   Positioned(top: 100, right: -300,    child: ecomCircularContainer(bgColor: ecomColors.textWhite.withOpacity(0.1))),
                
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


