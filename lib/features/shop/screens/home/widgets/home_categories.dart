import 'package:ecom_store/common/widgets/shimmers/category_shimmer.dart';
import 'package:ecom_store/features/shop/controllers/category_controller.dart';
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
    final categoryController = Get.put(CategoryController());

    return Obx(() {
      if (categoryController.isLoading.value)
        return const ecomCategoryShimmer();

      if (categoryController.featuredCategories.isEmpty) {
        return Center(
          child: Text('No Data Found!',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .apply(color: Colors.white)),
        );
      }
      return SizedBox(
        height: 80,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: categoryController.featuredCategories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final category = categoryController.featuredCategories[index];
            //The padding will add space between all the circular contianers.
            return ecomVerticalImageText(
                image: category.image,
                title: category.name,
                onTap: () => Get.to(() => const SubCategoriesScreen()));
          },
        ),
      );
    });
  }
}
