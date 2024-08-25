import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeImageCarousel extends StatelessWidget {
  /// Custom widget for home screen bannner.
  const HomeImageCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final List<String> imageLink = [
      "assets/images/HeadPhoneBanner.jpg",
      "assets/images/iPhoneBanner.jpg",
      "assets/images/HeadPhoneBanner.jpg",
      "assets/images/iPhoneBanner.jpg",
    ];
    return SizedBox(
      width: size.width,
      height: size.width * 0.5,
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          enlargeStrategy: CenterPageEnlargeStrategy.zoom,
          enlargeCenterPage: true,
          aspectRatio: 2,
        ),
        items: imageLink.map((image) {
          return Container(
            width: size.width,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage(image),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
