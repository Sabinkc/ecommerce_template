import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final List recentlySearched = ["Phone Case", "Laptop", "Watch", "Iphone", "Mouse", "Screen", "Earphone", "Headphone"];
    return KeyboardDismisser(
      gestures: const [GestureType.onTap, GestureType.onPanUpdateAnyDirection],
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          automaticallyImplyLeading: false,
          title: Text(
            "Search Products",
            style: Theme.of(context).textTheme.headlineSmall!.apply(),
          ),
          shape: const Border(
            bottom: BorderSide(color: SQColors.borderSecondary),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.close),
            ),
          ],
          forceMaterialTransparency: true,
        ),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "What are you looking for?",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(
                    height: SQSizes.md,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: size.height * 0.055,
                          // width: size.width * 0.7,
                          child: TextField(
                            autofocus: true,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Iconsax.search_normal_1_outline,
                                color: SQColors.borderPrimary,
                              ),
                              hintText: "Search",
                              hintStyle: Theme.of(context).textTheme.labelLarge!.apply(color: SQColors.textSecondary),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(color: SQColors.borderSecondary, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: const BorderSide(color: SQColors.black, width: 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: const BorderSide(color: SQColors.borderSecondary, width: 2),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: SQSizes.xs,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.sort,
                          color: Colors.black,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: SQSizes.xs,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Recently Searched",
                        style: Theme.of(context).textTheme.bodyLarge!.apply(color: SQColors.black),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Iconsax.trash_outline,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                  Wrap(
                    runSpacing: 10,
                    spacing: 10,
                    children: recentlySearched
                        .map(
                          (word) => Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
                            decoration: BoxDecoration(
                              color: SQColors.softGrey,
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: Text(
                              word,
                              style: Theme.of(context).textTheme.labelMedium!.apply(
                                    color: Colors.black,
                                    fontWeightDelta: 1,
                                  ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
