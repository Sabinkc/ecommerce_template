import 'package:ecommerce/common/widgets/elevatedbutton.dart';
import 'package:ecommerce/common/widgets/passwordfield.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import '../../../utils/constants/colors.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

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
            "Change Password",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          shape: const Border(
            bottom: BorderSide(color: SQColors.borderSecondary),
          ),
          forceMaterialTransparency: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create new password",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(
                height: SQSizes.sml,
              ),
              Text(
                "Your new password must be different from previous used passwords.",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: SQSizes.md,
              ),
              Text(
                "Password",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: SQSizes.sml,
              ),
              SQPasswordField(
                controller: TextEditingController(),
                obsure: true,
                func: () {},
              ),
              const SizedBox(
                height: SQSizes.xs,
              ),
              Text(
                "Must be at least 8 characters.",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: SQSizes.md,
              ),
              Text(
                "Confirm Password",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: SQSizes.sml,
              ),
              SQPasswordField(
                controller: TextEditingController(),
                obsure: true,
                func: () {},
              ),
              const SizedBox(
                height: SQSizes.xs,
              ),
              Text(
                "Both passwords must watch.",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: SQSizes.md,
              ),
              SQElevatedButton(
                func: () {},
                title: "Reset Password",
              )
            ],
          ),
        ),
      ),
    );
  }
}
