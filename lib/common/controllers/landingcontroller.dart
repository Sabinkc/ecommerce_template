import 'package:get/get.dart';

class LandingScreenController extends GetxController {
  static LandingScreenController get instance => Get.find();
  RxInt index = 0.obs;
  void changeindex(int currentindex) {
    index.value = currentindex;
  }
}
