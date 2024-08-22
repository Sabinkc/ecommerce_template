import 'package:ecommerce/features/authentication/screen/emailverification.dart';
import 'package:ecommerce/widgets/passwordfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../widgets/elevatedbutton.dart';
import '../../../widgets/logo.dart';
import '../../../widgets/policytext.dart';
import '../../../widgets/textfield.dart';
import '../controllers/signupcontroller.dart';

class SignUpScreen extends StatelessWidget {
  ///This Screen helps user create a new account. It have four input fields through which user can fill their details.
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final signupController = Get.put(SignupController());
    final size = MediaQuery.of(context).size;
    return KeyboardDismisser(
      gestures: const [GestureType.onTap, GestureType.onPanUpdateAnyDirection],
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: SQSizes.sml,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: SQSizes.md,
                  ),
                  const Logo(),
                  const SizedBox(
                    height: SQSizes.lg,
                  ),
                  Text(
                    "Create your account",
                    style: Theme.of(context).textTheme.titleLarge!.apply(
                          color: SQColors.black,
                          fontSizeDelta: 2,
                          letterSpacingDelta: 0.3,
                          //fontWeightDelta: 1,
                        ),
                  ),
                  const SizedBox(
                    height: SQSizes.xs,
                  ),
                  RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Sign up to create an account and get started with ",
                          style: Theme.of(context).textTheme.labelLarge!.apply(
                                fontWeightDelta: 1,
                              ),
                        ),
                        TextSpan(
                          text: "SysQube",
                          style: Theme.of(context).textTheme.labelLarge!.apply(
                                color: SQColors.primary,
                                fontWeightDelta: 2,
                              ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: SQSizes.spaceBtwSections,
                  ),
                  Text(
                    "Full Name",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: SQSizes.sml,
                  ),
                  SQTextField(controller: signupController.fullname, hinttext: "Jhon Doe"),
                  const SizedBox(
                    height: SQSizes.spaceBtwItems,
                  ),
                  Text(
                    "Email",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: SQSizes.sml,
                  ),
                  SQTextField(controller: signupController.email, hinttext: "jhondoe@example.com"),
                  const SizedBox(
                    height: SQSizes.spaceBtwItems,
                  ),
                  Text(
                    "Password",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: SQSizes.sml,
                  ),
                  Obx(
                    () => SQPasswordField(
                      controller: signupController.password,
                      obsure: signupController.hidepassword.value,
                      func: signupController.switchHide,
                    ),
                  ),
                  const SizedBox(
                    height: SQSizes.sm,
                  ),
                  Text(
                    "Min. 8 char, incl 1 uppercase and 1 lowercase letter, 1 number and 1 special character",
                    style: Theme.of(context).textTheme.labelSmall!.apply(
                          fontWeightDelta: 1,
                          fontSizeDelta: 1,
                        ),
                  ),
                  const SizedBox(
                    height: SQSizes.sml,
                  ),
                  Text(
                    "Confirm Password",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: SQSizes.sml,
                  ),
                  Obx(
                    () => SQPasswordField(
                      controller: signupController.confirmpassword,
                      obsure: signupController.hideconfirmpassword.value,
                      func: signupController.switchHideConfirm,
                    ),
                  ),
                  const SizedBox(
                    height: SQSizes.spaceBtwSections,
                  ),
                  SQElevatedButton(
                    func: () {
                      Get.to(
                        () => const EmailVerificationScreen(),
                      );
                    },
                    //func: signupController.textfieldchecker,
                    title: "SIGN UP",
                  ),
                  const SizedBox(
                    height: SQSizes.md,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already, Have an Account?",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      const SizedBox(
                        width: SQSizes.xs,
                      ),
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        overlayColor: WidgetStateColor.transparent,
                        child: Text(
                          "Sign in to SysQube",
                          style: Theme.of(context).textTheme.labelLarge!.apply(
                                color: SQColors.primary,
                                fontWeightDelta: 2,
                              ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.08,
                  ),
                  const SignUpPolicyText(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
