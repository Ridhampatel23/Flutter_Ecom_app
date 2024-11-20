import 'package:ecom_store/features/authentication/controllers/signup/signup_controller.dart';
import 'package:ecom_store/features/authentication/screens/singup/widgets/terms_and_conditions.dart';
import 'package:ecom_store/utils/helpers/helper_functions.dart';
import 'package:ecom_store/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/sizes.dart';
import '../verify_email.dart';

class ecomSignupForm extends StatelessWidget {
  const ecomSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    final dark = ecomHelperFunctions.isDarkMode(context);
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          ///First and Last Name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  validator: (value) => ecomValidator.validateEmptyText("First Name", value),
                  controller: controller.firstName,
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: "First Name", prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(width: ecomSizes.spaceBtwnInputFields),
              Expanded(
                child: TextFormField(
                  validator: (value) => ecomValidator.validateEmptyText("Last Name", value),
                  controller: controller.lastName,
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
            validator: (value) => ecomValidator.validateEmptyText("Username", value),
            controller: controller.userName,
            decoration: const InputDecoration(
                labelText: "Username", prefixIcon: Icon(Iconsax.user_edit)),
          ),
          const SizedBox(height: ecomSizes.spaceBtwnInputFields),

          ///Email
          TextFormField(
            validator: (value) => ecomValidator.validateEmail(value),
            controller: controller.email,
            decoration: const InputDecoration(
                labelText: "Email", prefixIcon: Icon(Iconsax.direct)),
          ),
          const SizedBox(height: ecomSizes.spaceBtwnInputFields),

          ///PhoneNumber
          TextFormField(
            validator: (value) => ecomValidator.validatePhoneNumber(value),
            controller: controller.phoneNumber,
            decoration: const InputDecoration(
                labelText: "Phone Number", prefixIcon: Icon(Iconsax.call)),
          ),
          const SizedBox(height: ecomSizes.spaceBtwnInputFields),

          ///Password
          Obx( // An Obx widget observes the changes and redraws the entire widget when anything is redrawn
            () =>  TextFormField(
              validator: (value) => ecomValidator.validatePassword(value),
              controller: controller.password,
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                labelText: "Password",
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(icon: Icon(controller.hidePassword.value ?  Iconsax.eye_slash : Iconsax.eye), onPressed: () => controller.hidePassword.value = !controller.hidePassword.value),
              ),
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
              onPressed: () => controller.signup(),
              child: const Text("Create Account"),
            ),
          )
        ],
      ),
    );
  }
}
