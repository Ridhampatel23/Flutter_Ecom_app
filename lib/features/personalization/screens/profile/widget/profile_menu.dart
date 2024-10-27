import 'package:ecom_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ecomProfileMenu extends StatelessWidget {
  const ecomProfileMenu({
    super.key,
    this.icon = Iconsax.arrow_right_34,
    required this.onPressed,
    required this.title,
    required this.value,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final String title, value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        // We added the padding because we are going to use the same widget for all the options in the
        //Profile Menu, so instead of hardcoding the space , we added a padding to the widget itself.
        padding: const EdgeInsets.symmetric(vertical: ecomSizes.spaceBtwnItems / 1.5),
        child: Row(
          children: [
            //Note: if you place them in the same row, they would render right next
            //to each other. So you wrap them with an expanded widget to make them take the whole width
            Expanded(
                flex: 3,
                child: Text(title,
                    style: Theme.of(context).textTheme.bodySmall,
                    overflow: TextOverflow.ellipsis)),
            Expanded(
                flex: 5,
                child: Text(value,
                    style: Theme.of(context).textTheme.bodyMedium,
                    overflow: TextOverflow.ellipsis)),
            Expanded(child: Icon(icon, size: 18)),
          ],
        ),
      ),
    );
  }
}
