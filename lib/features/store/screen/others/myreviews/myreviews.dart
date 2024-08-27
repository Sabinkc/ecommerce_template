import 'package:flutter/material.dart';
import '../../../../../utils/constants/colors.dart';
import 'widgets/myreviewcontainer.dart';

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
