import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../utils/constants/colors.dart';

class ReviewScreen extends StatelessWidget {
  /// This screen display all the review done ny users in the product.
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Reviews",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        shape: const Border(
          bottom: BorderSide(color: SQColors.borderSecondary),
        ),
        forceMaterialTransparency: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            Container(
              width: size.width,
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: SQColors.softGrey,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "4.5",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(
                    width: SQSizes.xs,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: RatingBarIndicator(
                      itemSize: 18,
                      rating: 4.5,
                      direction: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "10 Reviews",
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                            color: Colors.grey,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: SQSizes.md,
            ),
            Container(
              width: size.width,
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 15,
              ),
              decoration: BoxDecoration(
                color: SQColors.softGrey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.purple,
                        child: Text(
                          "S",
                          style: Theme.of(context).textTheme.headlineSmall!.apply(
                                color: Colors.white,
                              ),
                        ),
                      ),
                      const SizedBox(
                        width: SQSizes.sm,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Suman S.",
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            Text(
                              "1 week ago",
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ],
                        ),
                      ),
                      RatingBarIndicator(
                        itemSize: 18,
                        rating: 4.5,
                        direction: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: SQSizes.sm),
                  Text(
                    "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy.",
                    maxLines: 8,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: SQSizes.sm),
                  Row(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        margin: const EdgeInsets.only(
                          right: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                            image: AssetImage(
                              "assets/images/iphonecases/iphone15_1.jpg",
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        margin: const EdgeInsets.only(
                          right: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                            image: AssetImage(
                              "assets/images/iphonecases/iphone15_1.jpg",
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        margin: const EdgeInsets.only(
                          right: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                            image: AssetImage(
                              "assets/images/iphonecases/iphone15_1.jpg",
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: SQSizes.sm),
                  const Divider(
                    color: SQColors.borderPrimary,
                  ),
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
                      const Expanded(child: Text("0 Likes")),
                      InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.report_outlined,
                        ),
                      ),
                      const SizedBox(
                        width: SQSizes.xs,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
