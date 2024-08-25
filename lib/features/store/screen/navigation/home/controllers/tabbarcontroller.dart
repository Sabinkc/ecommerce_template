import 'package:get/get.dart';

class TabbarController extends GetxController {
  /// Custom Controller to change deals section in home page
  static TabbarController get instance => Get.find();

  // Storing current tab index
  RxInt currentTabIndex = 0.obs;

  // func to change tab index
  void changeTabIndex(int index) {
    currentTabIndex.value = index;
  }
}
