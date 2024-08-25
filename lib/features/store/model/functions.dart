import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screen/navigation/cart/controllers/quickcartcontrollers.dart';
import '../screen/navigation/cart/widgets/quickcart.dart';

// func to add comma in numbers
String formatNumber(num value) {
  return value.toString().replaceAllMapped(
        RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
        (Match match) => '${match[1]},',
      );
}

// func to show modal bottom sheet
void onCartClicked(productDetails) {
  final quickcartControllers = Get.put(QuickCartControllers());
  quickcartControllers.changeSelectedColorIndex(0);
  quickcartControllers.changeSelectedSpecIndex(0);
  quickcartControllers.quantity(1);
  showModalBottomSheet(
    enableDrag: false,
    isScrollControlled: true,
    context: Get.context!,
    builder: (context) => QuickCartScreen(
      productInfo: productDetails,
    ),
  );
}
