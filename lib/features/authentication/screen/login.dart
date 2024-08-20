import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:ecommerce/features/authentication/screen/signup.dart';
import '../../../common/screens/landing.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../widgets/elevatedbutton.dart';
import '../../../widgets/logo.dart';
import '../../../widgets/passwordfield.dart';
import '../../../widgets/policytext.dart';
import '../../../widgets/textfield.dart';
import '../controllers/logincontroller.dart';
import 'forgotpassword.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final loginController = Get.put(LoginController());

    return KeyboardDismisser(
      gestures: const [GestureType.onTap, GestureType.onPanUpdateAnyDirection],
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 30,
          forceMaterialTransparency: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
              child: SizedBox(
                height: size.height * 0.85,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Logo(),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    Text(
                      "Sign In To Your Account",
                      style: Theme.of(context).textTheme.headlineSmall!.apply(
                            color: SQColors.primary,
                            letterSpacingDelta: 0.3,
                          ),
                    ),
                    const SizedBox(
                      height: SQSizes.sm,
                    ),
                    Text(
                      "We're glad to see you again! Let's get started!",
                      style: Theme.of(context).textTheme.labelLarge!.apply(
                            fontWeightDelta: 1,
                            fontSizeDelta: 1,
                          ),
                    ),

                    const SizedBox(
                      height: SQSizes.spaceBtwSections,
                    ),
                    Text(
                      "Email",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SQTextField(
                      controller: loginController.email,
                      hinttext: "jhon@example.com",
                    ),
                    //Emailtextfield(controllername: loginController.email),
                    const SizedBox(
                      height: SQSizes.spaceBtwItems,
                    ),
                    Text(
                      "Password",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(
                      () => SQPasswordField(
                        controller: loginController.password,
                        obsure: loginController.hidepassword.value,
                        func: loginController.switchHide,
                      ),
                    ),
                    const SizedBox(
                      height: SQSizes.sml,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          Get.to(() => const ForgotPasswordScreen());
                        },
                        overlayColor: WidgetStateColor.transparent,
                        child: Text(
                          "Forgot Password?",
                          style: Theme.of(context).textTheme.bodyLarge!.apply(
                                color: SQColors.primary,
                              ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: SQSizes.sml,
                    ),
                    SQElevatedButton(
                      func: () {
                        Get.to(() => const LandingScreen());
                      },
                      // func: loginController.textfieldchecker,
                      title: "SIGN IN",
                    ),
                    const SizedBox(
                      height: SQSizes.md,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(
                          width: SQSizes.xs,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => const SignUpScreen());
                          },
                          overlayColor: WidgetStateColor.transparent,
                          child: Text(
                            "Register here",
                            style: Theme.of(context).textTheme.bodyLarge!.apply(
                                  color: SQColors.primary,
                                ),
                          ),
                        )
                      ],
                    ),
                    Flexible(
                      child: SizedBox(
                        height: size.width * 0.45,
                      ),
                    ),
                    const LoginPolicyText(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
