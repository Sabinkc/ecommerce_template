import 'package:ecommerce/features/store/screen/checkout/controllers/checkoutcontroller.dart';
import 'package:get/get.dart';

class CartControllers extends GetxController {
  /// This controller is for Cart it contollers all the function of cart screen.
  static CartControllers get instance => Get.find();

  //List to store all cart items
  RxList allCartItems = <Map<String, dynamic>>[].obs;

  // bool to select all items
  RxBool selectAll = false.obs;

  // List to store selected items
  RxList selectedCartItems = [].obs;

  // storing checkout controller
  final checkoutController = Get.put(CheckoutController());

  // func to find either the items is selected or not
  bool isSelected(String id) {
    return selectedCartItems.contains(id);
  }

  // func to either select or deselect the item
  void selectItems(String id) {
    // conditions to check either the item is selected or not
    isSelected(id)
        ? selectedCartItems.remove(id) // if it exist removing it from the list
        : selectedCartItems.add(id); // else adding it in the list

    // condition to check either all items are selected or not
    selectedCartItems.length == allCartItems.length ? selectAll.value = true : selectAll.value = false;
  }

  // func to select all items
  void selectAllItems() {
    // condition to check either all items are selected or not
    selectedCartItems.length == allCartItems.length
        ? selectedCartItems.clear() // if all are selected it will deselect all items
        : selectedCartItems.value = allCartItems // else will select all items
            .map(
              (item) => item["cartItemId"],
            )
            .toList();
    selectAllValue();
  }

  // func to change select all value
  void selectAllValue() {
    allCartItems.isNotEmpty
        ? selectedCartItems.length == allCartItems.length
            ? selectAll.value = true
            : selectAll.value = false
        : selectAll.value = false;
  }

  // func to remove item from list
  void removeItemFromCart(String cartItemId) {
    // removing the item from all list
    selectedCartItems.remove(cartItemId);
    allCartItems.removeWhere((item) => item["cartItemId"] == cartItemId);

    // calling func to change select all value
    selectAllValue();
  }

  // func to get quantity of the item
  int getItemQuantity(String cartId) {
    for (var cartItem in allCartItems) {
      if (cartItem["cartItemId"] == cartId) {
        return cartItem["itemQuantity"];
      }
    }
    return 0;
  }

  // func to increase quantity of the item
  void incrementItemQuantity(String cartId) {
    for (var cartItem in allCartItems) {
      if (cartItem["cartItemId"] == cartId) {
        cartItem["itemQuantity"] += 1;
        break;
      }
    }
    allCartItems.refresh();
  }

  // func to decrease quantity of the item
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

  // func to calculate total price of the selected item
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

  // func to add item for checkout
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
