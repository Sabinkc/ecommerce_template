import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  static ProductDetailsController get instance => Get.find();

  RxBool istitleExpanded = false.obs;
  RxBool isdescExpanded = false.obs;
  RxInt selectedColorIndex = 0.obs;
  void changetitleExpanded() {
    istitleExpanded.value = !istitleExpanded.value;
  }

  void changedescExpanded() {
    isdescExpanded.value = !isdescExpanded.value;
  }

  void changeSelectedColorIndex(int currentValue) {
    selectedColorIndex.value = currentValue;
  }
}
