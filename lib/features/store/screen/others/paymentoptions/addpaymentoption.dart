import 'package:ecommerce/common/widgets/elevatedbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import '../../../../../common/widgets/textfieldwithtitle.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class AddPaymentOptionScreen extends StatelessWidget {
  const AddPaymentOptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: const [
        GestureType.onTap,
        GestureType.onPanUpdateAnyDirection,
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Add New Card",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          shape: const Border(
            bottom: BorderSide(color: SQColors.borderSecondary),
          ),
          centerTitle: false,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.close_outlined,
                size: 30,
              ),
            ),
          ],
          forceMaterialTransparency: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFieldWithTitle(
                title: "Card Type",
                controller: TextEditingController(),
                hinttext: "Visa",
              ),
              TextFieldWithTitle(
                title: "Card Number",
                controller: TextEditingController(),
                hinttext: "154*******54",
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: TextFieldWithTitle(
                      title: "Expire Date",
                      hinttext: "01/01",
                      controller: TextEditingController(),
                    ),
                  ),
                  const SizedBox(
                    width: SQSizes.lg,
                  ),
                  Flexible(
                    child: TextFieldWithTitle(
                      title: "CVV",
                      hinttext: "1111",
                      controller: TextEditingController(),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: SQSizes.sm,
              ),
              SQElevatedButton(func: () {}, title: "Add Card"),
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}
