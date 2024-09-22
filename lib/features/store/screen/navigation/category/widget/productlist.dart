import 'package:ecommerce/features/store/model/alltabs.dart';
import 'package:flutter/material.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../common/widgets/sqgridlayout.dart';
import '../../../../model/products.dart';

class ProductListView extends StatelessWidget {
  /// Custom widget which take category id to display product of that category,
  /// along with it's banner.
  const ProductListView({
    super.key,
    required this.categoryId,
    this.bannerimage = "assets/images/headphone1banner.jpg",
  });
  final String categoryId, bannerimage;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // Filter products by categoryId
    List filteredProducts = categoryId.contains(categoryTabs[0]["option"]) ? products : products.where((product) => product["categoryId"] == categoryId).toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          bannerimage.isEmpty
              ? const SizedBox.shrink()
              : InkWell(
                  onTap: () {},
                  child: Container(
                    width: size.width,
                    height: size.height * 0.145,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(bannerimage),
                        fit: BoxFit.fitWidth,
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
