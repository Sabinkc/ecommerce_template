import 'package:get/get.dart';

class FilterController extends GetxController {
  static FilterController get instance => Get.find();
  RxList filterOption = [].obs;

  bool isOptionSelected(String option) {
    return filterOption.contains(option);
  }

  void addOption(String option) {
    filterOption.contains(option) ? filterOption.remove(option) : filterOption.add(option);
  }
}
