import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../common/controllers/landingcontroller.dart';
import '../../category/controllers/categorycontrollers.dart';
import '../../../../model/alltabs.dart';
import 'homecategorycontainer.dart';

class AllCategoryList extends StatelessWidget {
  /// Custom widget which shows all the category along with their pictures
  const AllCategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final categoryController = Get.put(CategoryControllers());
    final landingController = Get.put(LandingScreenController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: SizedBox(
        height: size.width * 0.22,
        child: ListView.builder(
          itemCount: categories.length,
          physics: const ClampingScrollPhysics(),
          shrinkWrap: false,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final category = categories[index];
            return InkWell(
              overlayColor: WidgetStateColor.transparent,
              onTap: () {
                categoryController.changeTabIndex(index + 1);
                landingController.changeindex(1);
              },
              child: HomeCategoryContainer(
                imagelink: category["image"],
                categroyName: category["categoryName"],
              ),
            );
          },
        ),
      ),
    );
  }
}
