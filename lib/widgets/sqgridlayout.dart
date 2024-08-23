import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../features/store/screen/productdetails.dart';
import '../features/store/screen/widgets/productcontainer.dart';

class SQGridLayout extends StatelessWidget {
  const SQGridLayout({
    super.key,
    required this.allproducts,
  });
  final List allproducts;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: size.width * 0.6,
        mainAxisSpacing: 5,
        crossAxisSpacing: 12,
      ),
      itemCount: allproducts.length,
      itemBuilder: (context, index) {
        final product = allproducts[index];
        return ProductContainer(
          productDetails: product,
          func: () {
            Get.to(
              preventDuplicates: false,
              () => ProductDetailsScreen(productDetails: product),
            );
          },
        );
      },
    );
  }
}
