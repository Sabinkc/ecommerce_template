import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../common/widgets/sectionheading.dart';
import '../../../../../common/widgets/sqgridlayout.dart';
import 'controllers/tabbarcontroller.dart';
import '../../../model/alltabs.dart';
import '../../../model/products.dart';
import 'widgets/cartcounteritem.dart';
import 'widgets/allcategorylist.dart';
import 'widgets/homeimagecarousel.dart';
import 'widgets/hometabbarcontainer.dart';
import 'widgets/searchandfiltercontainer.dart';
import 'widgets/wishlistcounteritem.dart';

class HomeScreen extends StatelessWidget {
  /// Home Screen UI which have search container, image carousel, category and
  /// Section tabs.
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final tabbarController = Get.put(TabbarController());
    return DefaultTabController(
      length: homeTabsOption.length,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Text(
              "SysQube",
              style: Theme.of(context).textTheme.headlineSmall!.apply(
                    fontWeightDelta: 1,
                  ),
            ),
          ),
          shape: const Border(
            bottom: BorderSide(color: SQColors.borderSecondary),
          ),
          actions: const [
            WishlistCounterItem(),
            CartCounterItem(),
          ],
          forceMaterialTransparency: true,
        ),
        body: SafeArea(
          child: NestedScrollView(
            physics: const ClampingScrollPhysics(),
            headerSliverBuilder: (_, isScrolled) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: SQColors.white,
                  expandedHeight: size.width * 1,
                  collapsedHeight: size.width * 1,
                  flexibleSpace: SizedBox(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: SQSizes.md,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                          ),
                          child: SearchAndFilterContainer(),
                        ),
                        const HomeImageCarousel(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: SectionHeading(
                            headingTitle: "Shop By Category",
                            func: () {},
                          ),
                        ),
                        const SizedBox(
                          height: SQSizes.md,
                        ),
                        const AllCategoryList(),
                      ],
                    ),
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  floating: true,
                  delegate: MyDelegate(
                    tabbar: TabBar(
                      tabAlignment: TabAlignment.start,
                      indicatorSize: TabBarIndicatorSize.label,
                      isScrollable: true,
                      padding: EdgeInsets.zero,
                      indicatorPadding: EdgeInsets.zero,
                      labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                      dividerColor: Colors.transparent,
                      indicatorColor: Colors.transparent,
                      onTap: (value) {
                        tabbarController.changeTabIndex(value);
                      },
                      tabs: homeTabsOption.asMap().entries.map(
                        (option) {
                          String tabsText = option.value;
                          return Obx(
                            () => HomeTabBarContainer(
                              currentIndex: tabbarController.currentTabIndex.value,
                              optionIndex: option.key,
                              tabsText: tabsText,
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ),
              ];
            },
            body: Padding(
              padding: const EdgeInsets.only(top: 15, left: 12, right: 12),
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: homeTabsOption.map((data) => SectionListView(section: data)).toList(),
                // children: [
                //   SQGridLayout(
                //     allproducts: products,
                //   ),
                //   const SectionListView(section: "New In"),
                //   const SectionListView(section: "Deals"),
                //   const SectionListView(section: "Popular"),
                //   const SectionListView(section: "Best Seller"),
                //   const SectionListView(section: "Test"),
                // ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SectionListView extends StatelessWidget {
  const SectionListView({
    super.key,
    required this.section,
  });
  final String section;
  @override
  Widget build(BuildContext context) {
    // Filter products by section

    List filteredProducts = section.contains("For you") ? products : products.where((product) => product["section"] == section).toList();

    return SQGridLayout(
      allproducts: filteredProducts,
    );
  }
}

class MyDelegate extends SliverPersistentHeaderDelegate {
  MyDelegate({required this.tabbar});
  final TabBar tabbar;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: SQColors.borderSecondary,
          ),
          bottom: BorderSide(
            color: SQColors.borderSecondary,
          ),
        ),
      ),
      height: 50,
      child: tabbar,
    );
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
