import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  /// This controller is for Product Details Screen
  static ProductDetailsController get instance => Get.find();

  // vairable to expanded title
  RxBool istitleExpanded = false.obs;

  // vairable to expanded desc
  RxBool isdescExpanded = false.obs;

  // vairable to store selected color index
  RxInt selectedColorIndex = 0.obs;

  // func to change title expanded value
  void changetitleExpanded() {
    istitleExpanded.value = !istitleExpanded.value;
  }

  // func to change desc expanded value
  void changedescExpanded() {
    isdescExpanded.value = !isdescExpanded.value;
  }

  // func to change selected color index value
  void changeSelectedColorIndex(int currentValue) {
    selectedColorIndex.value = currentValue;
  }
}
