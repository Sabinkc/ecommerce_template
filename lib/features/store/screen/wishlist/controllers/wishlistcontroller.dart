import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import '../../../../../utils/popups/loader.dart';

class WishlistController extends GetxController {
  // This controller is for Wishlist screen
  static WishlistController get instance => Get.find();

  // List to store favorite items
  RxList favoriteItems = [].obs;

  // func to check either the item is fav or not
  bool isFav(String id) {
    bool itemExists = favoriteItems.any(
      (element) => element["productId"] == id,
    );
    return itemExists;
  }

  // func to add item to WishList list
  void addToWishList(String id, dynamic product) {
    // conditions to check either the items is fav or not
    isFav(id)
        ? {
            // if fav, removing the item
            favoriteItems.remove(product),
            SQLoader.warningSnackBar(
              title: "Removed from Wishlist",
              message: "An Item has been removed from wishlist.",
              duration: 1,
              icon: Iconsax.bag_cross_1_outline,
            )
          }
        : {
            // else adding the item
            favoriteItems.add(product),
            SQLoader.sucessSnackBar(
              title: "Added to Wishlist",
              message: "An Item has been added to wishlist.",
              duration: 1,
              icon: Iconsax.bag_happy_outline,
            )
          };
  }
}
