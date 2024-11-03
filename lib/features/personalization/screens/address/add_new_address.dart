import 'package:ecom_store/common/widgets/appbar/appbar.dart';
import 'package:ecom_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ecomAppBar(showBackArrow: true, title: Text("Add New Address")),
      body: SingleChildScrollView(
        child:Padding(padding: const EdgeInsets.all(ecomSizes.defaultSpace),
        child: Form(
          child: Column(
            children: [
              TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.user), labelText: "Name")),
              const SizedBox(height: ecomSizes.spaceBtwnInputFields),
              TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.mobile), labelText: "Phone Number")),
              const SizedBox(height: ecomSizes.spaceBtwnInputFields),
              Row(
                children: [
                  Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building_31), labelText: "Street"))),
                  const SizedBox(width: ecomSizes.spaceBtwnInputFields),
                  Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.code), labelText: "Postal Code"))),
                ],
              ),
              const SizedBox(height: ecomSizes.spaceBtwnInputFields),
              Row(
                children: [
                  Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building), labelText: "City"))),
                  const SizedBox(width: ecomSizes.spaceBtwnInputFields),
                  Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.activity), labelText: "State"))),
                ],
              ),
              const SizedBox(height: ecomSizes.spaceBtwnInputFields),
              TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.global), labelText: "Country")),
              const SizedBox(height: ecomSizes.defaultSpace),
               SizedBox(width: double.infinity,
              height: 50,
              child: ElevatedButton(onPressed: (){}, child: const Text("Save")),
              ),

            ],
          ),
        ),
        ),
      ),
    );
  }
}
