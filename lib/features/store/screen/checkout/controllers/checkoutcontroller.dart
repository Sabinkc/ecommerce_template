import 'package:get/get.dart';

class CheckoutController extends GetxController {
  /// This controller is for Checkout Screen, which helps to calculator price
  /// and store checkout items
  static CheckoutController get instance => Get.find();

  // List to store checkout items
  RxList checkoutItem = [].obs;

  // Shipping fee
  double shippingFee = 50.0;

  // other variables
  RxDouble taxFee = 0.0.obs;
  RxDouble subTotal = 0.0.obs;
  RxDouble voucherDiscount = 0.0.obs;

  // func to get sub total
  double getSubTotalPrice() {
    // Loop to calculate subtotal from all items
    for (var item in checkoutItem) {
      int discountprice = item["discountedPrice"];
      int productPrice = item["productPrice"];
      int itemQuantity = item["itemQuantity"];
      int price = item["discount"] ? discountprice * itemQuantity : productPrice * itemQuantity;
      subTotal.value += price;
    }

    return subTotal.value;
  }

  // func to calculate tax
  double taxCalculator() {
    taxFee.value = double.parse((subTotal * 0.13).toStringAsFixed(2));
    return taxFee.value;
  }

  // func to add discount
  void addDiscount(double discount) {
    voucherDiscount.value = discount;
    getOrderTotal();
  }

  // func to reset all values
  void resetValue() {
    checkoutItem.value = [];
    taxFee.value = 0.0;
    subTotal.value = 0.0;
    voucherDiscount.value = 0.0;
  }

  // func to get total order price
  double getOrderTotal() {
    return subTotal.value + shippingFee - voucherDiscount.value;
  }
}
