import 'package:ecom_store/features/personalization/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/images_strings.dart';
import '../icons/ecom_circular_icon.dart';
import '../images/ecom_circular_image.dart';
import '../shimmers/shimmer.dart';

class ecomUserProfileTile extends StatelessWidget {
  const ecomUserProfileTile({
    super.key, required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller  = UserController.instance;
    return ListTile(
      leading: Obx(() {
        final networkImage = controller.user.value.profilePicture;
        final image = networkImage.isNotEmpty
            ? networkImage
            : ecomImages.clothingIcon;
        return controller.imageUploading.value
            ? const ecomShimmerEffect(
            width: 60, height: 60, radius: 60)
            : ecomCircularImage(
            image: image,
            width: 60,
            height: 60,
            padding: 0,
            isNetworkImage: networkImage.isNotEmpty);
      }),
      title: Text(controller.user.value.fullName, style: Theme.of(context).textTheme.headlineSmall!.apply(color: ecomColors.whiteColor)),
      subtitle: Text(controller.user.value.email, style: Theme.of(context).textTheme.bodyMedium!.apply(color: ecomColors.whiteColor)),
      trailing: IconButton(onPressed: onPressed, icon: const Icon(Iconsax.edit, color: ecomColors.whiteColor,)),
    );
  }
}
