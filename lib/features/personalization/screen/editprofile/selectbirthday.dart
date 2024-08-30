import 'package:ecommerce/common/widgets/elevatedbutton.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../utils/constants/colors.dart';

class SelectBirthdayScreen extends StatelessWidget {
  const SelectBirthdayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final controller = Get.put(BirthdayController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Birthday",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        shape: const Border(
          bottom: BorderSide(color: SQColors.borderSecondary),
        ),
        forceMaterialTransparency: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            Container(),
            SizedBox(
              height: size.height * 0.2,
              child: CupertinoDatePicker(
                initialDateTime: DateTime(2002, 10, 02),
                maximumDate: DateTime.now(),
                dateOrder: DatePickerDateOrder.dmy,
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (DateTime newDate) {
                  controller.getFormattedDate(newDate);
                },
              ),
            ),
            const SizedBox(
              height: SQSizes.sml,
            ),
            const SizedBox(
              height: SQSizes.md,
            ),
            Obx(
              () => SQElevatedButton(func: () {}, title: "Set Birthday: ${controller.birthday} "),
            ),
          ],
        ),
      ),
    );
  }
}

class BirthdayController extends GetxController {
  static BirthdayController get instance => Get.find();
  RxString birthday = "02 Oct, 2002".obs;

  void getFormattedDate(DateTime date) {
    String format = 'dd MMM, yyyy';
    birthday.value = DateFormat(format).format(date);
  }
}
