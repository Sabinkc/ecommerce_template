import 'package:get/get.dart';

class WishlistController extends GetxController {
  static WishlistController get instance => Get.find();

  RxList favoriteItems = [].obs;

  bool isFav(String id) {
    bool itemExists = favoriteItems.any((element) => element["productId"] == id);

    return itemExists;
  }

  void addToWishList(String id, dynamic product) {
    isFav(id) ? favoriteItems.remove(product) : favoriteItems.add(product);
  }
}
