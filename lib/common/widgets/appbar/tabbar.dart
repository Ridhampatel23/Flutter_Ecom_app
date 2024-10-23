import 'package:ecom_store/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';

class ecomTabBar extends StatelessWidget implements PreferredSizeWidget {
  const ecomTabBar({
    //When we try to scroll down, the heading texts for all the tabs
    //start losing opacity, to overcome this issue we need to create a
    //seperate class widget for Tabbar which implements preferredsize.
    super.key, required this.tabs,
  });

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    return TabBar(

      isScrollable: true,
      indicatorColor: ecomColors.primaryColor,
      unselectedLabelColor: ecomColors.darkGreyColor,
      labelColor: ecomHelperFunctions.isDarkMode(context) ? ecomColors
          .whiteColor : ecomColors.primaryColor,
      tabs: tabs,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(ecomDeviceUtils.getAppBarHeight());

}