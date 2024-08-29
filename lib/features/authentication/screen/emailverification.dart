import 'package:ecommerce/common/widgets/elevatedbutton.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:pinput/pinput.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: const [
        GestureType.onTap,
        GestureType.onPanUpdateAnyDirection,
      ],
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Email Verification",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          shape: const Border(
            bottom: BorderSide(color: SQColors.borderSecondary),
          ),
          forceMaterialTransparency: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Check your inbox",
                  style: Theme.of(context).textTheme.headlineSmall!.apply(
                        color: SQColors.black,
                        letterSpacingDelta: 0.1,
                      ),
                ),
              ),
              const SizedBox(
                height: SQSizes.xs,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "We have sent you a verification code in below email.",
                  style: Theme.of(context).textTheme.labelLarge!.apply(
                        fontWeightDelta: 1,
                        fontSizeDelta: 1,
                      ),
                ),
              ),
              const SizedBox(
                height: SQSizes.spaceBtwItems,
              ),
              const Icon(
                Icons.mark_email_unread_outlined,
                color: SQColors.primary,
                size: 120,
              ),
              const SizedBox(
                height: SQSizes.spaceBtwInputFields,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "sumansthahope@gmail.com",
                  style: Theme.of(context).textTheme.bodyLarge!.apply(
                        fontSizeDelta: 1,
                      ),
                ),
              ),
              const SizedBox(
                height: SQSizes.spaceBtwItems,
              ),
              Pinput(
                length: 5,
                defaultPinTheme: PinTheme(
                  margin: const EdgeInsets.only(right: 2),
                  width: 56,
                  height: 56,
                  textStyle: Theme.of(context).textTheme.headlineSmall,
                  decoration: BoxDecoration(
                    border: Border.all(color: SQColors.primary),
                    //color: SQColors.primary.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: SQSizes.spaceBtwSections,
              ),
              SizedBox(
                width: 150,
                child: SQElevatedButton(func: () {}, title: "RESEND"),
              ),
              const SizedBox(
                height: SQSizes.spaceBtwInputFields,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 60.0),
                child: Text(
                  "Didn't receive email? Check spam or try another email.",
                  textAlign: TextAlign.center,
                ),
              ),
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}
