import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/filtercontroller.dart';

class SortOption extends StatelessWidget {
  const SortOption({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    final filtercontroller = Get.put(FilterController());
    return Obx(
      () => InkWell(
        overlayColor: WidgetStateColor.transparent,
        onTap: () {
          filtercontroller.addOption(title);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: BoxDecoration(
            border: Border.all(
              color: filtercontroller.isOptionSelected(title) ? Colors.black : Colors.grey,
              width: 2,
            ),
          ),
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge!.apply(
                  color: filtercontroller.isOptionSelected(title) ? Colors.black : Colors.grey,
                ),
          ),
        ),
      ),
    );
  }
}
