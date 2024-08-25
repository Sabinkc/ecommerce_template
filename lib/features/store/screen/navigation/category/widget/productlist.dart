import 'package:flutter/material.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../common/widgets/sqgridlayout.dart';
import '../../../../model/products.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({
    super.key,
    required this.categoryId,
  });
  final String categoryId;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // Filter products by categoryId
    List filteredProducts = products.where((product) => product["categoryId"] == categoryId).toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              width: size.width,
              height: size.height * 0.15,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage("assets/images/Banner.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: SQSizes.md,
          ),
          SQGridLayout(
            allproducts: filteredProducts,
          ),
        ],
      ),
    );
  }
}
