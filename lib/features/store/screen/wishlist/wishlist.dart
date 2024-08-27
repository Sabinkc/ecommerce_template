import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../common/widgets/sqgridlayout.dart';
import 'controllers/wishlistcontroller.dart';
import '../../model/products.dart';
import 'widgets/emptywishlistcontainer.dart';
import 'widgets/wishlistitemcontainer.dart';

class WishListScreen extends StatelessWidget {
  /// User can find their favorite items in this Screen.
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
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 15.0),
                              child: Slidable(
                                key: UniqueKey(),
                                endActionPane: ActionPane(
                                  extentRatio: 0.3,
                                  motion: const ScrollMotion(),
                                  children: [
                                    Flexible(
                                      child: InkWell(
                                        overlayColor: WidgetStateColor.transparent,
                                        onTap: () {
                                          wishlistController.addToWishList(product["productId"], product);
                                        },
                                        child: Container(
                                          width: 150,
                                          height: 150,
                                          margin: const EdgeInsets.only(left: 15),
                                          color: Colors.red,
                                          child: const Icon(
                                            Iconsax.trash_outline,
                                            color: Colors.white,
                                            size: 25,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                child: WishlistItemContainer(
                                  productDetails: product,
                                ),
                              ),
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
