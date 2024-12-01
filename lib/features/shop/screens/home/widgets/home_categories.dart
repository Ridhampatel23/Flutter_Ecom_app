import 'package:ecom_store/features/shop/screens/sub_category/sub_categories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/image_text/vertical_image_text.dart';
import '../../../../../utils/constants/images_strings.dart';

class ecomHomeCategories extends StatelessWidget {
  const ecomHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          //The padding will add space between all the circular contianers.
          return ecomVerticalImageText(image: ecomImages.clothingIcon, title: 'Category', onTap: () => Get.to(() => const SubCategoriesScreen()));
        },
      ),
    );
  }
}
