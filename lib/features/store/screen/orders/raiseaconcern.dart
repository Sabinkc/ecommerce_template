import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import '../../../../common/widgets/elevatedbutton.dart';
import '../../../../common/widgets/textfieldwithtitle.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class RaiseAConcernScreen extends StatelessWidget {
  /// User can raise a concern through this page.
  /// User need to fill the form and submit it.
  const RaiseAConcernScreen({super.key});

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
            "Raise a concern",
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
            vertical: 10,
          ),
          child: Column(
            children: [
              Text(
                "We're sorry for any inconvenience you've experienced."
                " Please complete the form below, and we'll do our best to"
                " resolve the issue as quickly as possible.",
                style: Theme.of(context).textTheme.bodyLarge!.apply(
                      color: SQColors.darkerGrey,
                    ),
              ),
              const SizedBox(
                height: SQSizes.spaceBtwItems,
              ),
              TextFieldWithTitle(
                title: "Order Number",
                hinttext: "#1231239",
                controller: TextEditingController(),
              ),
              TextFieldWithTitle(
                title: "Issue",
                hinttext: "Damaged",
                controller: TextEditingController(),
              ),
              TextFieldWithTitle(
                title: "Description",
                hinttext: "Explain the issue.....",
                controller: TextEditingController(),
                maxline: 4,
              ),
              TextFieldWithTitle(
                title: "Contact Information",
                hinttext: "Email / Phone Number",
                controller: TextEditingController(),
              ),
              const SizedBox(
                height: SQSizes.spaceBtwItems,
              ),
              SQElevatedButton(
                func: () {},
                title: "Submit",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
