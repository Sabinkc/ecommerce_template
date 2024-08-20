import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/imagecarouselcontroller.dart';

class HomeImageCarousel extends StatelessWidget {
  const HomeImageCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final imageController = Get.put(ImageCarouselController());
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
        items: imageController.imageLink.map((image) {
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
