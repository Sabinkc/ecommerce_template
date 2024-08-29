import 'package:flutter/material.dart';
import '../../utils/constants/sizes.dart';
import 'textfield.dart';

class TextFieldWithTitle extends StatelessWidget {
  const TextFieldWithTitle({
    super.key,
    required this.title,
    required this.hinttext,
    required this.controller,
    this.maxline = 1,
  });

  final String title, hinttext;
  final TextEditingController controller;
  final int maxline;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: SQSizes.sml,
        ),
        SQTextField(
          controller: controller,
          hinttext: hinttext,
          maxline: maxline,
        ),
        const SizedBox(
          height: SQSizes.spaceBtwItems,
        ),
      ],
    );
  }
}
