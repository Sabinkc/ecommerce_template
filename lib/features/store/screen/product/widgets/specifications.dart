import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class SpecificationsScreen extends StatelessWidget {
  /// This Widget display specification details of products.
  /// It takes specification details.
  const SpecificationsScreen({super.key, required this.specificationDetails});
  final Map specificationDetails;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Specifications",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.close_outlined,
              size: 30,
            ),
          ),
        ],
        forceMaterialTransparency: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: specificationDetails.entries.map((entry) {
            return SpecificationContainer(title: entry.key, subtitle: entry.value);
          }).toList(),
        ),
      ),
    );
  }
}

class SpecificationContainer extends StatelessWidget {
  const SpecificationContainer({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title, subtitle;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      margin: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8),
            child: Row(
              children: [
                Text(
                  "◆",
                  style: Theme.of(context).textTheme.titleMedium!.apply(
                        color: SQColors.darkGrey,
                      ),
                ),
                const SizedBox(
                  width: SQSizes.sml,
                ),
                Flexible(
                  child: Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodyMedium!.apply(
                          color: SQColors.darkGrey,
                        ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
