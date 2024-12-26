import 'package:ecom_store/common/widgets/appbar/appbar.dart';
import 'package:ecom_store/utils/constants/sizes.dart';
import 'package:ecom_store/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../controllers/update_name_controller.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: ecomAppBar(
        showBackArrow: true,
        title: Text("Change Name", style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(padding: const EdgeInsets.all(ecomSizes.defaultSpace),
      child: Column(
        children: [
          /// Headings
          Text("Please use your real name for easy verification. This name will appear on several pages.", style: Theme.of(context).textTheme.labelMedium),
          const SizedBox(height: ecomSizes.spaceBtwnSections),

          /// Text field and button
          Form(
              key: controller.updateUserNameFormKey,
              child: Column(
            children: [
              TextFormField(
                controller: controller.firstName,
                validator: (value) => ecomValidator.validateEmptyText("First Name", value),
                expands: false,
                decoration: const InputDecoration(labelText: "First Name", prefixIcon: Icon(Iconsax.user)),
              ),
              const SizedBox(height: ecomSizes.spaceBtwnInputFields),
              TextFormField(
                controller: controller.lastName,
                validator: (value) => ecomValidator.validateEmptyText("Last Name", value),
                expands: false,
                decoration: const InputDecoration(labelText: "Last Name", prefixIcon: Icon(Iconsax.user)),
              ),
            ],
          )),
          const SizedBox(height: ecomSizes.spaceBtwnSections),

          /// Save Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(onPressed: () => controller.updateUserName(), child: const Text("Save")),
          )
        ],
      ),
      ),
    );
  }
}
