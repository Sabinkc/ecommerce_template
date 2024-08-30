import 'package:ecommerce/common/widgets/elevatedbutton.dart';
import 'package:ecommerce/common/widgets/textfieldwithtitle.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import '../../../../utils/constants/colors.dart';

class RequestAccountDeletionScreen extends StatelessWidget {
  const RequestAccountDeletionScreen({super.key});

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
            "Account Deletion",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          shape: const Border(
            bottom: BorderSide(color: SQColors.borderSecondary),
          ),
          forceMaterialTransparency: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
          child: Column(
            children: [
              Text(
                "Deleting your account will permanently remove your information."
                " This action cannot be undone.",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: SQSizes.md,
              ),
              TextFieldWithTitle(
                title: "Enter Your Password",
                hinttext: "",
                controller: TextEditingController(),
              ),
              const SizedBox(
                height: SQSizes.sm,
              ),
              SQElevatedButton(
                func: () {},
                title: "Delete Account",
              ),
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}
