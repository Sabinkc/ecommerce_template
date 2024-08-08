import 'package:get/get.dart';

class CartControllers extends GetxController {
  static CartControllers get instance => Get.find();
  RxList allCartItems = <Map<String, dynamic>>[].obs;
  RxBool selectAll = false.obs;
  RxList selectedCartItems = [].obs;
  RxInt quantity = 1.obs;

  bool isSelected(String id) {
    return selectedCartItems.contains(id);
  }

  void selectItems(String id) {
    isSelected(id) ? selectedCartItems.remove(id) : selectedCartItems.add(id);
    selectedCartItems.length == allCartItems.length ? selectAll.value = true : selectAll.value = false;
  }

  void selectAllItems() {
    if (!selectAll.value) {
      selectedCartItems.value = allCartItems.map((item) => item["cartItemId"].toString()).toList();
      selectAll.value = true;
    } else {
      selectedCartItems.clear();
      selectAll.value = false;
    }
  }

  void removeItemFromCart(String cartItemId) {
    selectedCartItems.remove(cartItemId);
    allCartItems.removeWhere((item) => item["cartItemId"].toString() == cartItemId);
  }

  int calculateTotalPrice() {
    int totalPrice = 0;

    for (var item in allCartItems) {
      if (selectedCartItems.contains(item["cartItemId"].toString())) {
        int price = item["discount"] ? int.parse(item["discountedPrice"].replaceAll(',', '')) : int.parse(item["productPrice"].replaceAll(',', ''));
        totalPrice += price;
      }
    }

    return totalPrice;
  }

  void addQuantity() {
    quantity.value += 1;
  }

  void removeQuantity() {
    quantity.value <= 1 ? quantity.value = 1 : quantity.value -= 1;
  }
}
