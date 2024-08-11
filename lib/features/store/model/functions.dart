import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screen/widgets/quickcart.dart';

String formatNumber(num value) {
  return value.toString().replaceAllMapped(
        RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
        (Match match) => '${match[1]},',
      );
}

void onCartClicked(productDetails) {
  showModalBottomSheet(
    enableDrag: false,
    isScrollControlled: true,
    context: Get.context!,
    builder: (context) => QuickCartScreen(
      productInfo: productDetails,
    ),
  );
}
