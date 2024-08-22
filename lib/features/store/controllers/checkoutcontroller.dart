import 'package:get/get.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();
  RxList checkoutItem = [].obs;
  double shippingFee = 50.0;
  RxDouble taxFee = 0.0.obs;
  RxDouble subTotal = 0.0.obs;
  RxDouble voucherDiscount = 0.0.obs;

  double getSubTotalPrice() {
    for (var item in checkoutItem) {
      int discountprice = item["discountedPrice"];
      int productPrice = item["productPrice"];
      int itemQuantity = item["itemQuantity"];
      int price = item["discount"] ? discountprice * itemQuantity : productPrice * itemQuantity;
      subTotal.value += price;
    }

    return subTotal.value;
  }

  double taxCalculator() {
    taxFee.value = double.parse((subTotal * 0.13).toStringAsFixed(2));
    return taxFee.value;
  }

  void addDiscount(double discount) {
    voucherDiscount.value = discount;
    getOrderTotal();
  }

  void resetValue() {
    checkoutItem.value = [];
    taxFee.value = 0.0;
    subTotal.value = 0.0;
    voucherDiscount.value = 0.0;
  }

  double getOrderTotal() {
    return subTotal.value + shippingFee - voucherDiscount.value;
  }
}
