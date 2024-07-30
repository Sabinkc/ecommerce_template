import 'package:flutter/material.dart';

class Emailtextfield extends StatelessWidget {
  const Emailtextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text.contains('@')) {
          final prefix = textEditingValue.text.substring(0, textEditingValue.text.indexOf('@') + 1);
          List<String> generatedDomainList = popularEmailDomains.map((domain) => '$prefix$domain').where((domain) => domain.startsWith(textEditingValue.text)).toList();
          return generatedDomainList;
        } else {
          return const Iterable<String>.empty();
        }
      },
      fieldViewBuilder: (context, controller1, focusNode, onFieldSubmitted) {
        return TextField(
          controller: controller1,
          focusNode: focusNode,
          onEditingComplete: onFieldSubmitted,
          decoration: const InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2),
            ),
          ),
        );
      },
    );
  }
}

const List<String> popularEmailDomains = [
  'gmail.com',
  'yahoo.com',
  'hotmail.com',
];
