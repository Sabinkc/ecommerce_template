import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../utils/constants/sizes.dart';

class ReviewItemContainer extends StatelessWidget {
  /// This Widget take product name, product image and rating controller.
  /// User can rating the product by clicking or draging across the star.
  /// Initial and Min Rating is set to 1 and Max rating is 5.

  const ReviewItemContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Image Container
        Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
              image: AssetImage("assets/images/iphonecases/iphone15_1.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          width: SQSizes.sm,
        ),
        // Product Name and Rating bar
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Benks ArmorPro Case for iPhone 15 Pro Max 600D Aramid Fiber Cover"),
              const SizedBox(
                height: SQSizes.xs,
              ),
              RatingBar.builder(
                itemSize: 24,
                initialRating: 0,
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {},
              ),
            ],
          ),
        )
      ],
    );
  }
}
