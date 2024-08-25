import 'package:get/get.dart';

class QuickCartControllers extends GetxController {
  // This controller is for quick cart, which controlls color, spec and quantity.
  static QuickCartControllers get instance => Get.find();

  // Storing selected color index
  RxInt selectedColorIndex = 0.obs;

  // Stroing selected spec index
  RxInt selectedSpecIndex = 0.obs;

  // Stroing quantity
  RxInt quantity = 1.obs;

  // Storing selected image index
  RxInt selectedImageIndex = 0.obs;

  // func to chnage image index
  void changeImageIndex(int index) {
    selectedImageIndex.value = index;
  }

  // func to change selected image index
  void changeSelectedColorIndex(int currentValue) {
    selectedColorIndex.value = currentValue;
  }

  // func to change selected spex index
  void changeSelectedSpecIndex(int currentValue) {
    selectedSpecIndex.value = currentValue;
  }

  // func to remove quantity
  void removeQuantity() {
    quantity <= 1 ? quantity.value = 1 : quantity.value -= 1;
  }

  // func to add quantity
  void addQuantity() {
    quantity.value += 1;
  }
}
