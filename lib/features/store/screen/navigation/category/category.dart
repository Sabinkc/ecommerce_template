import 'package:ecommerce/features/store/screen/filter/filter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import 'controllers/categorycontrollers.dart';
import '../../../model/alltabs.dart';
import 'widget/productlist.dart';

class CategoryScreen extends StatelessWidget {
  /// User can surf thru different category on this screen
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryControllers = Get.put(CategoryControllers());
    return KeyboardDismisser(
      gestures: const [GestureType.onTap, GestureType.onPanUpdateAnyDirection],
      child: DefaultTabController(
        length: categoryTabs.length,
        initialIndex: categoryControllers.tabIndex.value,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              "Category",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            shape: const Border(
              bottom: BorderSide(color: SQColors.borderSecondary),
            ),
            forceMaterialTransparency: true,
            actions: [
              IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => const FilterScreen(),
                  );
                },
                icon: const Icon(
                  Icons.sort,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            ],
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
              child: Column(
                children: [
                  TabBar(
                    dividerColor: Colors.transparent,
                    indicatorColor: SQColors.primary,
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    indicatorSize: TabBarIndicatorSize.label,
                    onTap: (value) => categoryControllers.changeTabIndex(value),
                    tabs: categoryTabs.asMap().entries.map((entry) {
                      Map data = entry.value;
                      return Tab(
                        child: Obx(
                          () => Text(
                            data["option"],
                            style: Theme.of(context).textTheme.titleMedium!.apply(
                                  color: categoryControllers.tabIndex.value == entry.key ? SQColors.primary : SQColors.black,
                                ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(
                    height: SQSizes.md,
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    child: TabBarView(
                      physics: const ClampingScrollPhysics(),
                      children: categoryTabs.asMap().entries.map(
                        (entry) {
                          Map data = entry.value;

                          return ProductListView(
                            categoryId: data["option"],
                            bannerimage: data["banner"],
                          );
                        },
                      ).toList(),
                    ),
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
