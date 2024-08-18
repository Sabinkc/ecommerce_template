import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/widgets/elevatedbutton.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import '../../../../utils/constants/colors.dart';

class EditAddressScreen extends StatelessWidget {
  const EditAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return KeyboardDismisser(
      gestures: const [
        GestureType.onTap,
        GestureType.onPanUpdateAnyDirection,
      ],
      child: Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          shape: const Border(
            bottom: BorderSide(color: SQColors.borderSecondary),
          ),
          centerTitle: true,
          title: Text(
            "Edit Address",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 20,
          ),
          child: Column(
            children: [
              AddAddressTextField(
                controller: TextEditingController(text: "Suman Shrestha"),
                title: "Name",
                icon: Iconsax.user_outline,
              ),
              AddAddressTextField(
                controller: TextEditingController(text: "9818167498"),
                title: "Phone Number",
                icon: Icons.numbers_outlined,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: AddAddressTextField(
                      controller: TextEditingController(text: "Chunikhel"),
                      title: "Street",
                      icon: Iconsax.buildings_2_outline,
                    ),
                  ),
                  const SizedBox(
                    width: SQSizes.md,
                  ),
                  Expanded(
                    child: AddAddressTextField(
                      controller: TextEditingController(text: "Karuna Hospital"),
                      title: "Landmark",
                      icon: Iconsax.building_4_outline,
                    ),
                  ),
                ],
              ),
              AddAddressTextField(
                controller: TextEditingController(text: "Budanilkantha"),
                title: "Muncipality",
                icon: Iconsax.map_1_outline,
              ),
              const SizedBox(
                height: SQSizes.xs,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Address Category",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  Radio(
                    value: true,
                    groupValue: true,
                    fillColor: const WidgetStatePropertyAll(SQColors.primary),
                    onChanged: (value) {},
                  ),
                  Text(
                    "Home",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Radio(
                    value: false,
                    groupValue: true,
                    onChanged: (value) {},
                  ),
                  Text(
                    "Office",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Shipping & Billing Address",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  Radio(
                    value: true,
                    groupValue: true,
                    fillColor: const WidgetStatePropertyAll(SQColors.primary),
                    onChanged: (value) {},
                  ),
                  Text(
                    "Yes",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Radio(
                    value: false,
                    groupValue: true,
                    onChanged: (value) {},
                  ),
                  Text(
                    "No",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              const SizedBox(
                height: SQSizes.md,
              ),
              SizedBox(
                width: size.width,
                height: size.height * 0.055,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: const BorderSide(
                        color: SQColors.primary,
                        width: 2,
                      ),
                    ),
                  ),
                  child: Text(
                    "Delete Address",
                    maxLines: 1,
                    style: Theme.of(context).textTheme.headlineSmall!.apply(
                          color: Colors.black,
                        ),
                  ),
                ),
              ),
              const SizedBox(
                height: SQSizes.md,
              ),
              SQElevatedButton(
                func: () {},
                title: "Save Changes",
              ),
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}

class AddAddressTextField extends StatelessWidget {
  const AddAddressTextField({
    super.key,
    required this.controller,
    required this.title,
    required this.icon,
  });

  final TextEditingController controller;
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: SQSizes.sm,
        ),
        TextField(
          controller: controller,
          style: Theme.of(context).textTheme.bodyLarge,
          decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: SQColors.borderPrimary, width: 2),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: SQColors.black, width: 2),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: SQColors.borderPrimary, width: 2),
            ),
          ),
        ),
        const SizedBox(
          height: SQSizes.sml,
        ),
      ],
    );
  }
}
