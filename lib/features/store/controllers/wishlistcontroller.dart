import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../utils/popups/loader.dart';

class WishlistController extends GetxController {
  static WishlistController get instance => Get.find();

  RxList favoriteItems = [].obs;

  bool isFav(String id) {
    bool itemExists = favoriteItems.any((element) => element["productId"] == id);

    return itemExists;
  }

  void addToWishList(String id, dynamic product) {
    isFav(id) ? favoriteItems.remove(product) : favoriteItems.add(product);
    isFav(id)
        ? SQLoader.sucessSnackBar(
            title: "Added to Wishlist",
            message: "An Item has been added to wishlist.",
            duration: 1,
            icon: Iconsax.bag_happy_outline,
          )
        : SQLoader.warningSnackBar(
            title: "Removed from Wishlist",
            message: "An Item has been removed from wishlist.",
            duration: 1,
            icon: Iconsax.bag_cross_1_outline,
          );
  }
}
