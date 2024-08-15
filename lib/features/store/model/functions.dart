import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/quickcartcontrollers.dart';
import '../screen/widgets/quickcart.dart';

String formatNumber(num value) {
  return value.toString().replaceAllMapped(
        RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
        (Match match) => '${match[1]},',
      );
}

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
