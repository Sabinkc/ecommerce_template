import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/common/widgets/elevatedbutton.dart';
import 'package:ecommerce/common/widgets/textfield.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';

class EditUserScreen extends StatelessWidget {
  const EditUserScreen({
    super.key,
    required this.title,
    required this.subtitle,
    required this.hintText,
  });
  final String title, subtitle, hintText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit $title",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        shape: const Border(
          bottom: BorderSide(color: SQColors.borderSecondary),
        ),
        forceMaterialTransparency: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Enter new $subtitle in below field.",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(
              height: SQSizes.sml,
            ),
            SQTextField(
              controller: TextEditingController(),
              hinttext: hintText,
            ),
            const SizedBox(
              height: SQSizes.md,
            ),
            SQElevatedButton(
              func: () {},
              title: "UPDATE",
            ),
            Container(),
          ],
        ),
      ),
    );
  }
}
