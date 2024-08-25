import 'package:flutter/material.dart';
import '../../utils/constants/colors.dart';

class SQTextField extends StatelessWidget {
  /// Basic TextField which take TextEditingController and Hinttext.
  const SQTextField({
    super.key,
    required this.controller,
    required this.hinttext,
  });

  final TextEditingController controller;
  final String hinttext;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hinttext,
        hintStyle: Theme.of(context).textTheme.labelLarge!.apply(color: SQColors.textSecondary),
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
    );
  }
}
