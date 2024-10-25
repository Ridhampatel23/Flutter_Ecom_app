import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../icons/ecom_circular_icon.dart';

class ecomUserProfileTile extends StatelessWidget {
  const ecomUserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ecomCircularIcon(icon: Iconsax.user, width: 50, height: 50),
      title: Text("Ridham", style: Theme.of(context).textTheme.headlineSmall!.apply(color: ecomColors.whiteColor)),
      subtitle: Text("Ridham1234@gmail.com", style: Theme.of(context).textTheme.bodyMedium!.apply(color: ecomColors.whiteColor)),
      trailing: IconButton(onPressed: () {}, icon: Icon(Iconsax.edit, color: ecomColors.whiteColor,)),
    );
  }
}
