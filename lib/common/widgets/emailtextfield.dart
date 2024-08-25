import 'package:flutter/material.dart';
import '../../utils/constants/colors.dart';

class Emailtextfield extends StatelessWidget {
  const Emailtextfield({super.key, required this.controllername});
  final TextEditingController controllername;
  @override
  Widget build(BuildContext context) {
    const List<String> popularEmailDomains = [
      'gmail.com',
      'outlook.com',
      'sysqube.com.np',
      'yahoo.com',
      'hotmail.com',
      'aol.com',
      'hotmail.co.uk',
      'live.com',
    ];

    return Autocomplete<String>(
      optionsMaxHeight: 200,
      optionsBuilder: (controllername) {
        if (controllername.text.contains('@')) {
          final prefix = controllername.text.substring(0, controllername.text.indexOf('@') + 1);
          List<String> generatedDomainList = popularEmailDomains.map((domain) => '$prefix$domain').where((domain) => domain.startsWith(controllername.text)).toList();
          return generatedDomainList;
        } else {
          return const Iterable<String>.empty();
        }
      },
      onSelected: (option) => controllername.text = option,
      fieldViewBuilder: (context, controllername, focusNode, onFieldSubmitted) {
        return TextField(
          controller: controllername,
          focusNode: focusNode,
          onEditingComplete: onFieldSubmitted,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.none,
          decoration: InputDecoration(
            hintText: "jhon@example.com",
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
          ),
        );
      },
    );
  }
}
