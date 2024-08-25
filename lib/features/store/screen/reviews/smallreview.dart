import 'package:ecommerce/features/store/screen/reviews/review.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/common/widgets/elevatedbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/colors.dart';
import 'SmallReviewContainer.dart';

class SmallReviewScreen extends StatelessWidget {
  /// Custom Screen which shows three reviews done by users and a button to
  /// navigate user to review screen.
  const SmallReviewScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Reviews",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        shape: const Border(
          bottom: BorderSide(color: SQColors.borderSecondary),
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
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            const SmallReviewContainer(
              imagelink: "assets/images/iphonecases/iphone15_1.jpg",
              review: "Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a ",
              rating: 3.5,
              reviewedBy: "Suman S.",
            ),
            const SmallReviewContainer(
              imagelink: "assets/images/iphonecases/iphone15_1.jpg",
              review: "Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a ",
              rating: 3.5,
              reviewedBy: "Suman S.",
            ),
            const SmallReviewContainer(
              imagelink: "assets/images/iphonecases/iphone15_1.jpg",
              review: "Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a ",
              rating: 3.5,
              reviewedBy: "Suman S.",
            ),
            const SizedBox(
              height: SQSizes.md,
            ),
            SQElevatedButton(func: () => Get.to(() => const ReviewScreen()), title: "View All"),
            const SizedBox(
              height: SQSizes.md,
            ),
          ],
        ),
      ),
    );
  }
}
