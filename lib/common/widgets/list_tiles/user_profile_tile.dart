import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../icons/ecom_circular_icon.dart';

class ecomUserProfileTile extends StatelessWidget {
  const ecomUserProfileTile({
    super.key, required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const ecomCircularIcon(icon: Iconsax.user, width: 50, height: 50),
      title: Text("User1234", style: Theme.of(context).textTheme.headlineSmall!.apply(color: ecomColors.whiteColor)),
      subtitle: Text("user123@gmail.com", style: Theme.of(context).textTheme.bodyMedium!.apply(color: ecomColors.whiteColor)),
      trailing: IconButton(onPressed: onPressed, icon: Icon(Iconsax.edit, color: ecomColors.whiteColor,)),
    );
  }
}
