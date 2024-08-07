import 'package:get/get.dart';

class WishlistController extends GetxController {
  static WishlistController get instance => Get.find();

  RxList favoriteItems = [].obs;

  bool isFav(String id) {
    return favoriteItems.contains(id);
  }

  void addToWishList(String id) {
    isFav(id) ? favoriteItems.remove(id) : favoriteItems.add(id);
  }
}
