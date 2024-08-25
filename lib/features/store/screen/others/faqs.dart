import 'package:accordion/accordion.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';

class FAQsScreen extends StatelessWidget {
  /// This Screen have frequently asked questions for users.
  const FAQsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "FAQs",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        shape: const Border(
          bottom: BorderSide(color: SQColors.borderSecondary),
        ),
        forceMaterialTransparency: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Frequently Asked Questions (FAQs)",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: SQSizes.xs,
            ),
            Text(
              "A FAQs or Frequently Ask Questions is a section that helps user find information without needing to contact customer services.",
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Accordion(
              paddingListHorizontal: 0,
              headerBackgroundColor: SQColors.softGrey,
              headerPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15.0),
              contentBackgroundColor: SQColors.softGrey,
              contentBorderWidth: 0,
              rightIcon: const Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 30,
                color: SQColors.black,
              ),
              children: [
                AccordionSection(
                  isOpen: true,
                  header: Text(
                    "What is SysQube E-commerce ?",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  content: const Text(
                    "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
                  ),
                ),
                AccordionSection(
                  header: Text(
                    "How to mute notifications ?",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  content: const Text(
                    "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
                  ),
                ),
                AccordionSection(
                  header: Text(
                    "How to add more than one address ?",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  content: const Text(
                    "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FAQsAccordin extends StatelessWidget {
  const FAQsAccordin({
    super.key,
    required this.title,
    required this.func,
    required this.hide,
  });

  final String title;
  final VoidCallback func;
  final bool hide;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      tileColor: SQColors.softGrey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      trailing: Icon(
        hide ? Icons.keyboard_arrow_down_rounded : Icons.keyboard_arrow_up_rounded,
        size: 30,
        color: SQColors.black,
      ),
      onTap: func,
    );
  }
}

class FAQsDescription extends StatelessWidget {
  const FAQsDescription({
    super.key,
    required this.content,
  });
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: SQColors.softGrey,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        content,
        style: Theme.of(context).textTheme.titleSmall!.apply(
              color: Colors.black,
            ),
        textAlign: TextAlign.start,
      ),
    );
  }
}
