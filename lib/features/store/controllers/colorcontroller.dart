import 'package:get/get.dart';

class ColorController extends GetxController {
  static ColorController get instance => Get.find();
  RxInt selectedColorIndex = 0.obs;
  void chageSelectedColorIndex(int currentValue) {
    selectedColorIndex.value = currentValue;
  }
}
