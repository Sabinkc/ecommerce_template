import 'package:get/get.dart';

class QuickCartControllers extends GetxController {
  static QuickCartControllers get instance => Get.find();
  RxInt selectedColorIndex = 0.obs;
  RxInt selectedSpecIndex = 0.obs;
  RxInt quantity = 1.obs;

  void changeSelectedColorIndex(int currentValue) {
    selectedColorIndex.value = currentValue;
  }

  void changeSelectedSpecIndex(int currentValue) {
    selectedSpecIndex.value = currentValue;
  }

  void removeQuantity() {
    quantity <= 1 ? quantity.value = 1 : quantity.value -= 1;
  }

  void addQuantity() {
    quantity.value += 1;
  }
}
