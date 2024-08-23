import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../widgets/sqgridlayout.dart';
import '../controllers/wishlistcontroller.dart';
import '../model/products.dart';
import 'widgets/emptywishlistcontainer.dart';
import 'widgets/wishlistitemcontainer.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final wishlistController = Get.put(WishlistController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Wishlist",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        shape: const Border(
          bottom: BorderSide(color: SQColors.borderSecondary),
        ),
        forceMaterialTransparency: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              Obx(
                () => wishlistController.favoriteItems.isEmpty
                    ? const EmptyWishlistContainer()
                    : Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: ListView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: wishlistController.favoriteItems.map((product) {
                            return WishlistItemContainer(
                              productDetails: product,
                            );
                          }).toList(),
                        ),
                      ),
              ),
              const SizedBox(
                height: SQSizes.md,
              ),
              const Align(
                alignment: Alignment.center,
                child: Text("You might like to fill it with"),
              ),
              const SizedBox(
                height: SQSizes.md,
              ),
              SQGridLayout(
                allproducts: products,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
