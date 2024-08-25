import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/common/widgets/elevatedbutton.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import '../../../../utils/constants/colors.dart';
import 'widget/addresstextfield.dart';

class AddAddressScreen extends StatelessWidget {
  /// Through this screen user can add address.
  /// User need to fill all textfields.
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            "Add Address",
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
                controller: TextEditingController(),
                title: "Name",
                icon: Iconsax.user_outline,
              ),
              AddAddressTextField(
                controller: TextEditingController(),
                title: "Phone Number",
                icon: Icons.numbers_outlined,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: AddAddressTextField(
                      controller: TextEditingController(),
                      title: "Street",
                      icon: Iconsax.buildings_2_outline,
                    ),
                  ),
                  const SizedBox(
                    width: SQSizes.md,
                  ),
                  Expanded(
                    child: AddAddressTextField(
                      controller: TextEditingController(),
                      title: "Landmark",
                      icon: Iconsax.building_4_outline,
                    ),
                  ),
                ],
              ),
              AddAddressTextField(
                controller: TextEditingController(),
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
                    value: false,
                    groupValue: true,
                    onChanged: (value) {},
                  ),
                  Text(
                    "Home",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Radio(
                    value: true,
                    groupValue: true,
                    fillColor: const WidgetStatePropertyAll(SQColors.primary),
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
              SQElevatedButton(
                func: () {},
                title: "SAVE",
              ),
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}
