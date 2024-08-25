import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../utils/constants/colors.dart';

class MyReviewsScreen extends StatelessWidget {
  /// This screen shows all the reviews done by user in different products.
  const MyReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Reviews",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        shape: const Border(
          bottom: BorderSide(color: SQColors.borderSecondary),
        ),
        forceMaterialTransparency: true,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        child: Column(
          children: [
            MyReviewContainer(
              imagelink: "assets/images/iphonecases/iphone15_1.jpg",
              productTitle: "Benks ArmorPro Case for iPhone 15 Pro Max 600D Aramid Fiber Cover",
              date: "08/21/2024",
              rating: 3.5,
              review:
                  "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy.",
              like: 4,
            ),
          ],
        ),
      ),
    );
  }
}

class MyReviewContainer extends StatelessWidget {
  const MyReviewContainer({
    super.key,
    required this.imagelink,
    required this.productTitle,
    required this.date,
    required this.review,
    required this.rating,
    required this.like,
  });

  final String imagelink, productTitle, date, review;
  final double rating;
  final int like;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: SQColors.softGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(imagelink),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: SQSizes.sm,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productTitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: SQSizes.xs,
                    ),
                    Text(
                      date,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const SizedBox(
                      height: SQSizes.xs,
                    ),
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
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: SQSizes.sm,
          ),
          Text(
            review,
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(
            height: SQSizes.sm,
          ),
          const Divider(
            color: SQColors.borderPrimary,
          ),
          const SizedBox(
            height: SQSizes.sm,
          ),
          Row(
            children: [
              Container(
                width: 90,
                height: 90,
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/iphonecases/iphone15_1.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: 90,
                height: 90,
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/iphonecases/iphone15_1.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: 90,
                height: 90,
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: Colors.cyanAccent,
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/iphonecases/iphone15_1.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: SQSizes.sm),
          const Divider(
            color: SQColors.borderPrimary,
          ),
          const SizedBox(height: SQSizes.xs),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: SQSizes.sm,
              ),
              InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.thumb_up_alt_outlined,
                ),
              ),
              const SizedBox(
                width: SQSizes.sm,
              ),
              Expanded(child: Text("$like Likes")),
              InkWell(
                onTap: () {},
                child: const Icon(
                  Iconsax.trash_outline,
                ),
              ),
              const SizedBox(
                width: SQSizes.xs,
              ),
            ],
          )
        ],
      ),
    );
  }
}
