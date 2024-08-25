import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/popups/loader.dart';
import '../../../utils/popups/screenloader.dart';
import '../../../utils/validators/validation.dart';

class SignupController extends GetxController {
  /// This controller is for Signup Screen, it controlls all textfield, password
  /// obscure and also have validation. On successful login it will take user to
  /// landing screen.
  static SignupController get instance => Get.find();
  final hidepassword = true.obs;
  final hideconfirmpassword = true.obs;
  final fullname = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmpassword = TextEditingController();
  GlobalKey<FormState> signupformkey = GlobalKey<FormState>();

  // func to obscure password
  void switchHide() {
    hidepassword.value = !hidepassword.value;
  }

  // func to obscure password
  void switchHideConfirm() {
    hideconfirmpassword.value = !hideconfirmpassword.value;
  }

// func to validate textfields
  Future<void> textfieldchecker() async {
    // storing user inputted data into strings for validation
    String userfullname = fullname.text.trim();
    String useremail = email.text.trim();
    String userpassword = password.text.trim();
    String userconfrimpassword = confirmpassword.text.trim();

    // validating inputted email
    String? emailtester = SQValidator.validateEmail(useremail);
    // validating inputted password
    String? passwordtester = SQValidator.validatePassword(userpassword);

    // list to store errors
    List<String> errorlist = [];

    // showing circular progress indicator for user feedback
    ScreenLoader.openLoadingDialog();

    // Storing Errors
    userfullname.isEmpty ? errorlist.add("Please fill all fields") : null;
    emailtester != null ? errorlist.add(emailtester) : null;
    passwordtester != null ? errorlist.add(passwordtester) : null;
    userpassword != userconfrimpassword ? errorlist.add("Password doesn't match") : null;

    // closing circular progress indicator
    ScreenLoader.stopLoadingDialog();
    // conditon to check either errorlist is empty or not
    errorlist.isNotEmpty
        // Displaying the error
        ? SQLoader.warningSnackBar(title: "ERROR", message: errorlist[0])
        : {
            // calling login function
            signup(useremail, userpassword),
            // clearing both textfields
            fullname.clear(),
            email.clear(),
            password.clear(),
            confirmpassword.clear(),
          };
  }

  /// This function take user inputted email, password and fullname to perform sign up.
  /// If user doesnot exist, it will create a new user then navigates user to landing screen
  /// else throw errors.
  Future<void> signup(String email, String password) async {}
}
