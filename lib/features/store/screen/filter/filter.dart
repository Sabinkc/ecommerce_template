import 'package:ecommerce/common/widgets/textfield.dart';
import 'package:ecommerce/features/store/model/alltabs.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import '../../../../utils/constants/colors.dart';
import 'widget/sortoption.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: const [
        GestureType.onTap,
        GestureType.onPanUpdateAnyDirection,
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Filters",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          shape: const Border(
            bottom: BorderSide(color: SQColors.borderSecondary),
          ),
          centerTitle: false,
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
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Price",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: SQSizes.sml,
              ),
              Row(
                children: [
                  Flexible(
                    child: SizedBox(
                      height: 45,
                      child: SQTextField(
                        controller: TextEditingController(),
                        hinttext: "Min",
                        inputType: TextInputType.number,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: SQSizes.sm,
                  ),
                  const Text(
                    "-",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(
                    width: SQSizes.sm,
                  ),
                  Flexible(
                    child: SizedBox(
                      height: 45,
                      child: SQTextField(
                        controller: TextEditingController(),
                        hinttext: "Max",
                        inputType: TextInputType.number,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: SQSizes.md,
              ),
              Text(
                "Sort By",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: SQSizes.sml,
              ),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: sortOptions.map(
                  (option) {
                    return SortOption(title: option);
                  },
                ).toList(),
              ),
              const SizedBox(
                height: SQSizes.md,
              ),
              Text(
                "Categories",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: SQSizes.sml,
              ),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: categoryTabs.map(
                  (option) {
                    return SortOption(title: option);
                  },
                ).toList(),
              ),
              const SizedBox(
                height: SQSizes.md,
              ),
              Text(
                "Brands",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: SQSizes.sml,
              ),
              Wrap(
                spacing: 10,
                runSpacing: 12,
                children: brands.map(
                  (option) {
                    return SortOption(title: option);
                  },
                ).toList(),
              ),
              const SizedBox(
                height: SQSizes.md,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
