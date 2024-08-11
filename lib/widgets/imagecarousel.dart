import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../utils/constants/colors.dart';

class ImageCarousel extends StatelessWidget {
  const ImageCarousel({
    super.key,
    required this.imageController,
    required this.images,
  });

  final PageController imageController;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: size.height * 0.4,
          child: PageView(
            controller: imageController,
            scrollDirection: Axis.horizontal,
            children: images.map((image) {
              return Container(
                height: size.height * 0.4,
                width: size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(image),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        Positioned(
          bottom: size.height * 0.02,
          child: SmoothPageIndicator(
            controller: imageController,
            count: images.length,
            effect: const WormEffect(
              activeDotColor: SQColors.black,
              dotHeight: 6,
              dotWidth: 30,
              strokeWidth: 1,
            ),
          ),
        ),
      ],
    );
  }
}
