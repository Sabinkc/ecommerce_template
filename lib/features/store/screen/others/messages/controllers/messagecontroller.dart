import 'package:get/get.dart';

class MessagesController extends GetxController {
  static MessagesController get instance => Get.find();

  RxInt tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }
}
