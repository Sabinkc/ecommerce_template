import 'package:ecommerce/features/store/screen/reviews/review.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class SmallReviewContainer extends StatelessWidget {
  /// Custom review container which take image link, review, rating and reviewedBy.
  /// It is shown when user click on Reviews in product details screen.
  /// Tapping on this container will take user to full review screen.
  const SmallReviewContainer({
    super.key,
    required this.imagelink,
    required this.review,
    required this.reviewedBy,
    required this.rating,
    this.func,
  });

  final String imagelink, review, reviewedBy;
  final double rating;
  final void Function()? func;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      overlayColor: WidgetStateColor.transparent,
      onTap: func ??
          () {
            Get.to(() => const ReviewScreen());
          },
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        width: size.width,
        decoration: BoxDecoration(
          color: SQColors.softGrey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      review,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(
                      height: SQSizes.xs,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        RatingBarIndicator(
                          itemSize: 18,
                          rating: rating,
                          direction: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                        ),
                        const SizedBox(
                          width: SQSizes.sm,
                        ),
                        Text(
                          reviewedBy,
                          style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.grey),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: SQSizes.sm,
            ),
            Container(
              height: 85,
              width: 85,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10,
                ),
                image: DecorationImage(
                  image: AssetImage(imagelink),
                  fit: BoxFit.fill,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
