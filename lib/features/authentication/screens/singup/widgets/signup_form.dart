import 'package:ecom_store/features/authentication/screens/singup/widgets/terms_and_conditions.dart';
import 'package:ecom_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/sizes.dart';
import '../verify_email.dart';

class ecomSignupForm extends StatelessWidget {
  const ecomSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = ecomHelperFunctions.isDarkMode(context);
    return Form(
      child: Column(
        children: [
          ///First and Last Name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: "First Name", prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(width: ecomSizes.spaceBtwnInputFields),
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: "Last Name", prefixIcon: Icon(Iconsax.user)),
                ),
              )
            ],
          ),
          const SizedBox(height: ecomSizes.spaceBtwnInputFields),

          ///Username
          TextFormField(
            decoration: const InputDecoration(
                labelText: "Username", prefixIcon: Icon(Iconsax.user_edit)),
          ),
          const SizedBox(height: ecomSizes.spaceBtwnInputFields),

          ///Email
          TextFormField(
            decoration: const InputDecoration(
                labelText: "Email", prefixIcon: Icon(Iconsax.direct)),
          ),
          const SizedBox(height: ecomSizes.spaceBtwnInputFields),

          ///PhoneNumber
          TextFormField(
            decoration: const InputDecoration(
                labelText: "Phone Number", prefixIcon: Icon(Iconsax.call)),
          ),
          const SizedBox(height: ecomSizes.spaceBtwnInputFields),

          ///Password
          TextFormField(
            decoration: const InputDecoration(
              labelText: "Password",
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
          ),
          const SizedBox(height: ecomSizes.spaceBtwnSections),

          ///Terms and Conditions Checkbox
          const ecomTermsAndConditions(),
          const SizedBox(height: ecomSizes.spaceBtwnSections),

          ///Sing Up Button
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () => Get.to(() => const VerifyEmailScreen()),
              child: const Text("Create Account"),
            ),
          )
        ],
      ),
    );
  }
}
