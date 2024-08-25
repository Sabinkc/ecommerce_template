import 'package:flutter/material.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class AddAddressTextField extends StatelessWidget {
  /// Textfield for address, which take title, icon and controller.
  const AddAddressTextField({
    super.key,
    required this.controller,
    required this.title,
    required this.icon,
  });

  final TextEditingController controller;
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: SQSizes.sm,
        ),
        TextField(
          controller: controller,
          style: Theme.of(context).textTheme.bodyLarge,
          decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
            ),
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
        ),
        const SizedBox(
          height: SQSizes.sml,
        ),
      ],
    );
  }
}
