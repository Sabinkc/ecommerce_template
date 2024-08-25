import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../common/widgets/sqgridlayout.dart';
import 'controllers/categorycontrollers.dart';
import '../../../model/alltabs.dart';
import '../../../model/products.dart';
import 'widget/productlist.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                      return Tab(
                        child: Obx(
                          () => Text(
                            entry.value,
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
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                width: size.width,
                                height: size.height * 0.15,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                    image: AssetImage("assets/images/Banner.jpg"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: SQSizes.md,
                              ),
                              SQGridLayout(
                                allproducts: products,
                              ),
                            ],
                          ),
                        ),
                        const ProductListView(categoryId: "Headphones"),
                        const ProductListView(categoryId: "Watches"),
                        const ProductListView(categoryId: "Cases"),
                        const ProductListView(categoryId: "Speakers"),
                        const ProductListView(categoryId: "Airpods"),
                        Container(),
                      ],
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
