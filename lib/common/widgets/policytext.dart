import 'package:ecommerce/features/authentication/screen/policyandterms.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/colors.dart';

class LoginPolicyText extends StatelessWidget {
  const LoginPolicyText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: WidgetStateColor.transparent,
      onTap: () => Get.to(() => const PolicyAndTermsScreen()),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: "By signing in to your account, you agree to our ",
              style: Theme.of(context).textTheme.labelSmall!.apply(
                    fontWeightDelta: 1,
                  ),
            ),
            TextSpan(
              text: "Privacy & Cookie Policy",
              style: Theme.of(context).textTheme.labelSmall!.apply(
                    color: SQColors.primary,
                    fontWeightDelta: 2,
                  ),
            ),
            TextSpan(
              text: " and ",
              style: Theme.of(context).textTheme.labelSmall!.apply(
                    fontWeightDelta: 1,
                  ),
            ),
            TextSpan(
              text: "Terms & Conditions",
              style: Theme.of(context).textTheme.labelSmall!.apply(
                    color: SQColors.primary,
                    fontWeightDelta: 2,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpPolicyText extends StatelessWidget {
  const SignUpPolicyText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: WidgetStateColor.transparent,
      onTap: () => Get.to(() => const PolicyAndTermsScreen()),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: "By joining, you agree to the ",
              style: Theme.of(context).textTheme.labelSmall!.apply(
                    fontWeightDelta: 1,
                  ),
            ),
            TextSpan(
              text: "Terms and Conditions",
              style: Theme.of(context).textTheme.labelSmall!.apply(
                    color: const Color(0xFF000000),
                    fontWeightDelta: 2,
                  ),
            ),
            TextSpan(
              text: " and confirm that you have read and understand the ",
              style: Theme.of(context).textTheme.labelSmall!.apply(
                    fontWeightDelta: 1,
                  ),
            ),
            TextSpan(
              text: "Privacy Policy.",
              style: Theme.of(context).textTheme.labelSmall!.apply(
                    color: const Color(0xFF000000),
                    fontWeightDelta: 2,
                    fontSizeDelta: 1,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
