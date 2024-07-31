import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../utils/constants/colors.dart';

class SQPasswordField extends StatelessWidget {
  ///Custom TextField for passwords. It takes a TextEditingController, bool variable and void function.
  const SQPasswordField({
    super.key,
    required this.controller,
    required this.obsure,
    required this.func,
  });

  final TextEditingController controller;
  final bool obsure;
  final VoidCallback func;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obsure,
      obscuringCharacter: "*",
      decoration: InputDecoration(
        hintText: "**********",
        hintStyle: Theme.of(context).textTheme.labelLarge!.apply(color: SQColors.textSecondary),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: SQColors.borderSecondary, width: 2),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: SQColors.black, width: 2),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: SQColors.borderSecondary, width: 2),
        ),
        suffixIcon: IconButton(
          highlightColor: Colors.transparent,
          onPressed: func,
          icon: Icon(
            obsure ? Iconsax.eye_slash_outline : Iconsax.eye_outline,
            color: SQColors.textSecondary,
          ),
        ),
      ),
    );
  }
}
