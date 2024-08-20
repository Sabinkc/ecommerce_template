import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/screens/landing.dart';
import '../../../utils/popups/loader.dart';
import '../../../utils/popups/screenloader.dart';
import '../../../utils/validators/validation.dart';

class LoginController extends GetxController {
  /// This controller is for Login Screen, it controlls all textfield, password
  /// obscure and also have validation. On successful login it will take user to
  /// landing screen.
  static LoginController get instance => Get.find();
  final hidepassword = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  void switchHide() {
    hidepassword.value = !hidepassword.value;
  }

  Future<void> textfieldchecker() async {
    String useremail = email.text.trim();
    String userpassword = password.text.trim();
    String? emailtester = SQValidator.validateEmail(useremail);
    List<String> errorlist = [];
    ScreenLoader.openLoadingDialog();
    if (emailtester != null) {
      errorlist.add(emailtester);
    }
    if (userpassword.isEmpty) {
      errorlist.add("Please fill all fields.");
    }

    if (errorlist.isNotEmpty) {
      ScreenLoader.stopLoadingDialog();
      SQLoader.warningSnackBar(title: "ERROR", message: errorlist[0]);
    } else {
      ScreenLoader.stopLoadingDialog();
      login(useremail, userpassword);
      email.clear();
      password.clear();
    }
  }

  Future<void> login(String email, String password) async {
    Get.to(() => const LandingScreen());
  }
}
