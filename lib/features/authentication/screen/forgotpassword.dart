import 'package:ecommerce/widgets/elevatedbutton.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../widgets/textfield.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

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
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: SQSizes.spaceBtwItems,
                ),
                Text(
                  "Forgot Password",
                  style: Theme.of(context).textTheme.headlineMedium!.apply(
                        color: SQColors.black,
                        letterSpacingDelta: 0.3,
                        fontWeightDelta: 1,
                      ),
                ),
                const SizedBox(
                  height: SQSizes.xs,
                ),
                Text(
                  "Enter your email to get password rest link.",
                  style: Theme.of(context).textTheme.labelLarge!.apply(
                        fontWeightDelta: 1,
                        fontSizeDelta: 1,
                      ),
                ),
                const SizedBox(
                  height: SQSizes.spaceBtwSections,
                ),
                SQTextField(controller: TextEditingController(), hinttext: "jhondoe@example.com"),
                const SizedBox(
                  height: SQSizes.spaceBtwSections,
                ),
                SQElevatedButton(func: () {}, title: "SUBMIT"),
                Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
