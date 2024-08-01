import 'package:flutter/material.dart';
import '../../../utils/constants/sizes.dart';
import '../../../widgets/imagecarousel.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final imageController = PageController();
    final List<String> imageLink = [
      "assets/images/phonecase.jpg",
      "assets/images/phonecase_1.jpg",
      "assets/images/phonecase_2.jpg",
    ];
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(
                height: SQSizes.appBarHeight,
              ),
              ImageCarousel(
                imageController: imageController,
                images: imageLink,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
