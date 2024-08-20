import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../search.dart';

class SearchAndFilterContainer extends StatelessWidget {
  const SearchAndFilterContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Get.to(() => const SearchScreen(), transition: Transition.rightToLeft);
      },
      child: Container(
        height: size.height * 0.055,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: SQColors.borderSecondary,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Iconsax.search_normal_1_outline,
              color: SQColors.darkGrey,
              size: 24,
            ),
            const SizedBox(
              width: SQSizes.sm,
            ),
            Text(
              "Search...",
              style: Theme.of(context).textTheme.bodyLarge!.apply(color: SQColors.textSecondary),
            ),
            const Spacer(),
            const VerticalDivider(
              thickness: 1.5,
            ),
            const SizedBox(
              width: SQSizes.xs,
            ),
            const Icon(
              Icons.sort,
              color: Colors.black,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
