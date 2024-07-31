import 'package:ecommerce/features/authentication/controllers/logincontroller.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:icons_plus/icons_plus.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final loginController = Get.put(LoginController());

    return KeyboardDismisser(
      gestures: const [GestureType.onTap, GestureType.onPanUpdateAnyDirection],
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LoginTitle(),
                SizedBox(
                  height: size.height * 0.065,
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
                        fontWeightDelta: 2,
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
                TextField(
                  controller: loginController.email,
                  decoration: InputDecoration(
                    hintText: "jhon@example.com",
                    hintStyle: Theme.of(context).textTheme.labelLarge!.apply(color: SQColors.textSecondary),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: SQColors.borderSecondary, width: 2),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: SQColors.black, width: 2),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: SQColors.borderSecondary, width: 2),
                    ),
                  ),
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
                  () => TextField(
                    controller: loginController.password,
                    obscureText: loginController.hidepassword.value,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                      hintText: "**********",
                      hintStyle: Theme.of(context).textTheme.labelLarge!.apply(color: SQColors.textSecondary),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: SQColors.borderSecondary, width: 2),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: SQColors.black, width: 2),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: SQColors.borderSecondary, width: 2),
                      ),
                      suffixIcon: IconButton(
                        highlightColor: Colors.transparent,
                        onPressed: () {
                          loginController.hidepassword.value = !loginController.hidepassword.value;
                        },
                        icon: Icon(
                          loginController.hidepassword.value ? PixelArtIcons.eye_closed : PixelArtIcons.eye,
                          color: SQColors.textSecondary,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: SQSizes.xs,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password?",
                      style: Theme.of(context).textTheme.titleMedium!.apply(
                            color: SQColors.primary,
                            fontWeightDelta: 1,
                          ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: SQSizes.xs,
                ),
                SizedBox(
                  width: size.width,
                  height: size.height * 0.062,
                  child: ElevatedButton(
                    onPressed: () {
                      loginController.textfieldchecker();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: SQColors.primary,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    ),
                    child: Text(
                      "SIGN IN",
                      style: Theme.of(context).textTheme.headlineSmall!.apply(
                            color: Colors.white,
                            letterSpacingDelta: 1,
                          ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: SQSizes.sm,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        shape: const RoundedRectangleBorder(),
                      ),
                      child: Text(
                        "Register here",
                        style: Theme.of(context).textTheme.titleMedium!.apply(
                              color: SQColors.primary,
                              fontWeightDelta: 2,
                            ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: size.height * 0.1,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "By signing in to your account, you agree to our ",
                        style: Theme.of(context).textTheme.labelLarge!.apply(
                              fontWeightDelta: 1,
                              fontSizeDelta: 1,
                            ),
                      ),
                      TextSpan(
                        text: "Privacy & Cookie Policy",
                        style: Theme.of(context).textTheme.labelLarge!.apply(
                              color: SQColors.primary,
                              fontWeightDelta: 2,
                              fontSizeDelta: 1,
                            ),
                      ),
                      TextSpan(
                        text: " and ",
                        style: Theme.of(context).textTheme.labelLarge!.apply(
                              fontWeightDelta: 1,
                            ),
                      ),
                      TextSpan(
                        text: "Terms & Conditions",
                        style: Theme.of(context).textTheme.labelLarge!.apply(
                              color: SQColors.primary,
                              fontWeightDelta: 2,
                              fontSizeDelta: 1,
                            ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginTitle extends StatelessWidget {
  const LoginTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        children: [
          TextSpan(
            text: "SysQube",
            style: TextStyle(
              fontFamily: 'Work Sans',
              fontSize: 34,
              fontWeight: FontWeight.w600,
              color: Color(0xFF3E3D3D),
            ),
          ),
          TextSpan(
            text: ".",
            style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.w600,
              color: Color(0xFF000000),
            ),
          ),
          TextSpan(
            text: "dev",
            style: TextStyle(
              fontFamily: 'Work Sans',
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1976CD),
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
