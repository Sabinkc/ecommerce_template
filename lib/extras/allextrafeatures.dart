import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../features/store/screen/reviews/SmallReviewContainer.dart';
import '../features/store/screen/reviews/review.dart';
import '../utils/constants/colors.dart';
import '../utils/constants/sizes.dart';

class AllExtraFeaturesScreen extends StatelessWidget {
  const AllExtraFeaturesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Reviews and Rating (5)",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                InkWell(
                  overlayColor: WidgetStateColor.transparent,
                  onTap: () => Get.to(
                    () => const ReviewScreen(),
                  ),
                  child: Text(
                    "View All",
                    style: Theme.of(context).textTheme.bodySmall!.apply(
                          color: SQColors.black,
                        ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: SQSizes.xs,
            ),
            const SmallReviewContainer(
              imagelink: "assets/images/headphone.jpg",
              review: "Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a ",
              rating: 3.5,
              reviewedBy: "Suman S.",
            ),
            const SmallReviewContainer(
              imagelink: "assets/images/headphone.jpg",
              review: "Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a ",
              rating: 3.5,
              reviewedBy: "Suman S.",
            ),
            const SmallReviewContainer(
              imagelink: "assets/images/headphone.jpg",
              review: "Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a ",
              rating: 3.5,
              reviewedBy: "Suman S.",
            ),
          ],
        ),
      ),
    );
  }
}
