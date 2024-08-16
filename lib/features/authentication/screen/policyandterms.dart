import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/colors.dart';

class PolicyAndTermsScreen extends StatelessWidget {
  const PolicyAndTermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final tabController = Get.put(TabController());
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          shape: const Border(
            bottom: BorderSide(color: SQColors.borderSecondary),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Last Updated: 01 Aug 2024",
                  style: Theme.of(context).textTheme.labelLarge!.apply(color: SQColors.textSecondary),
                ),
                SizedBox(
                  height: size.height * 0.065,
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: SQColors.primary,
                    overlayColor: WidgetStateColor.transparent,
                    labelStyle: Theme.of(context).textTheme.titleMedium!.apply(color: Colors.black),
                    unselectedLabelStyle: Theme.of(context).textTheme.titleMedium!.apply(color: SQColors.textSecondary),
                    tabs: const [
                      Tab(
                        text: "Privacy Policy",
                      ),
                      Tab(
                        text: "Terms and Conditions",
                      ),
                    ],
                    onTap: (index) {
                      tabController.changeTabIndex(index);
                    },
                  ),
                ),
                const Flexible(
                  fit: FlexFit.loose,
                  child: TabBarView(
                    children: [
                      Center(
                        child: Text("Privacy Policy"),
                      ),
                      Center(
                        child: Text("Terms and Conditions"),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TabController extends GetxController {
  var selectedIndex = 0.obs;

  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }
}
