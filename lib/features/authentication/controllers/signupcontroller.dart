import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/popups/loader.dart';
import '../../../utils/popups/screenloader.dart';
import '../../../utils/validators/validation.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();
  final hidepassword = true.obs;
  final hideconfirmpassword = true.obs;
  final fullname = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmpassword = TextEditingController();
  GlobalKey<FormState> signupformkey = GlobalKey<FormState>();

  void switchHide() {
    hidepassword.value = !hidepassword.value;
  }

  void switchHideConfirm() {
    hideconfirmpassword.value = !hideconfirmpassword.value;
  }

  Future<void> textfieldchecker() async {
    String userfullname = fullname.text.trim();
    String useremail = email.text.trim();
    String userpassword = password.text.trim();
    String userconfrimpassword = confirmpassword.text.trim();
    String? emailtester = SQValidator.validateEmail(useremail);
    String? passwordtester = SQValidator.validatePassword(userpassword);
    List<String> errorlist = [];
    ScreenLoader.openLoadingDialog();
    if (userfullname.isEmpty) {
      errorlist.add("Please fill all fields");
    }
    if (emailtester != null) {
      errorlist.add(emailtester);
    }
    if (passwordtester != null) {
      errorlist.add(passwordtester);
    }
    if (userpassword != userconfrimpassword) {
      errorlist.add("Password doesn't match");
    }

    if (errorlist.isNotEmpty) {
      ScreenLoader.stopLoadingDialog();
      SQLoader.warningSnackBar(title: "ERROR", message: errorlist[0]);
    } else {
      ScreenLoader.stopLoadingDialog();
      signup(useremail, userpassword);
      fullname.clear();
      email.clear();
      password.clear();
      confirmpassword.clear();
    }
  }

  Future<void> signup(String email, String password) async {}
}
