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

  // func to obscure password
  void switchHide() {
    hidepassword.value = !hidepassword.value;
  }

  // func to validate textfields
  Future<void> textfieldchecker() async {
    // storing user inputted data into strings for validation
    String useremail = email.text.trim();
    String userpassword = password.text.trim();

    // validating inputted email
    String? emailtester = SQValidator.validateEmail(useremail);

    // list to store errors
    List<String> errorlist = [];

    // showing circular progress indicator for user feedback
    ScreenLoader.openLoadingDialog();

    // Storing Errors
    emailtester != null ? errorlist.add(emailtester) : null;
    userpassword.isEmpty ? errorlist.add("Please fill all fields.") : null;

    // closing circular progress indicator
    ScreenLoader.stopLoadingDialog();

    // conditon to check either errorlist is empty or not
    errorlist.isNotEmpty
        ? SQLoader.warningSnackBar(title: "ERROR", message: errorlist[0]) // Displaying the error
        : {
            login(useremail, userpassword), // calling login function
            // clearing both textfields
            email.clear(),
            password.clear(),
          };
  }

  /// This function take user inputted email and password to perform login.
  /// If user exist it navigates user to landing screen else throw errors.
  Future<void> login(String email, String password) async {
    Get.to(() => const LandingScreen());
  }
}
