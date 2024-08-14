import 'package:ecommerce/features/store/controllers/checkoutcontroller.dart';
import 'package:get/get.dart';

class CartControllers extends GetxController {
  static CartControllers get instance => Get.find();
  RxList allCartItems = <Map<String, dynamic>>[].obs;
  RxBool selectAll = false.obs;
  RxList selectedCartItems = [].obs;
  final checkoutController = Get.put(CheckoutController());
  bool isSelected(String id) {
    return selectedCartItems.contains(id);
  }

  void selectItems(String id) {
    isSelected(id) ? selectedCartItems.remove(id) : selectedCartItems.add(id);
    selectedCartItems.length == allCartItems.length ? selectAll.value = true : selectAll.value = false;
  }

  void selectAllItems() {
    selectedCartItems.length == allCartItems.length ? selectedCartItems.clear() : selectedCartItems.value = allCartItems.map((item) => item["cartItemId"]).toList();
    selectAllValue();
  }

  void selectAllValue() {
    allCartItems.isNotEmpty
        ? selectedCartItems.length == allCartItems.length
            ? selectAll.value = true
            : selectAll.value = false
        : selectAll.value = false;
  }

  void removeItemFromCart(String cartItemId) {
    selectedCartItems.remove(cartItemId);
    allCartItems.removeWhere((item) => item["cartItemId"] == cartItemId);
    selectAllValue();
  }

  int getItemQuantity(String cartId) {
    for (var cartItem in allCartItems) {
      if (cartItem["cartItemId"] == cartId) {
        return cartItem["itemQuantity"];
      }
    }
    return 0;
  }

  void incrementItemQuantity(String cartId) {
    for (var cartItem in allCartItems) {
      if (cartItem["cartItemId"] == cartId) {
        cartItem["itemQuantity"] += 1;

        break;
      }
    }
    allCartItems.refresh();
  }

  void decrementItemQuantity(String cartId) {
    for (var cartItem in allCartItems) {
      if (cartItem["cartItemId"] == cartId) {
        if (cartItem["itemQuantity"] > 1) {
          cartItem["itemQuantity"] -= 1;
        }
        break;
      }
    }
    allCartItems.refresh();
  }

  int calculateTotalPrice() {
    int totalPrice = 0;

    for (var item in allCartItems) {
      if (selectedCartItems.contains(item["cartItemId"])) {
        int discountprice = item["discountedPrice"];
        int productPrice = item["productPrice"];
        int itemQuantity = item["itemQuantity"];
        int price = item["discount"] ? discountprice * itemQuantity : productPrice * itemQuantity;
        totalPrice += price;
      }
    }

    return totalPrice;
  }

  void addToCheckout() {
    checkoutController.resetValue();
    for (var item in allCartItems) {
      if (selectedCartItems.contains(item["cartItemId"])) {
        bool itemExists = checkoutController.checkoutItem.any((element) => element["cartItemId"] == item["cartItemId"]);
        if (!itemExists) {
          checkoutController.checkoutItem.add(item);
        }
      }
    }
  }
}
