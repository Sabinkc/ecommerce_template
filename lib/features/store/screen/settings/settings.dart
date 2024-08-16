import 'package:ecommerce/features/authentication/screen/policyandterms.dart';
import 'package:ecommerce/features/store/screen/settings/appsettings.dart';
import 'package:ecommerce/features/store/screen/settings/messagesettings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
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
            SettingTile(
              title: 'Message Settings',
              icon: Iconsax.message_edit_outline,
              func: () => Get.to(
                () => const MessageSettings(),
              ),
            ),
            SettingTile(
              title: 'App Settings',
              icon: Iconsax.setting_outline,
              func: () => Get.to(
                () => const AppSettings(),
              ),
            ),
            SettingTile(
              title: 'Conditions',
              icon: Iconsax.stickynote_outline,
              func: () => Get.to(
                () => const PolicyAndTermsScreen(),
              ),
            ),
            SettingTile(
              title: 'Help',
              icon: Iconsax.information_outline,
              func: () {},
            ),
            SettingTile(
              title: 'Feedback',
              icon: Iconsax.personalcard_outline,
              func: () {},
            ),
            SettingTile(
              title: 'Request Account Deletion',
              icon: Iconsax.user_minus_outline,
              func: () {},
            ),
            const SizedBox(
              height: SQSizes.xl,
            ),
            SizedBox(
              width: size.width,
              height: size.height * 0.055,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: const BorderSide(
                      color: SQColors.primary,
                      width: 2,
                    ),
                  ),
                ),
                child: Text(
                  "LOG OUT",
                  maxLines: 1,
                  style: Theme.of(context).textTheme.headlineSmall!.apply(
                        color: Colors.black,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingTile extends StatelessWidget {
  const SettingTile({
    super.key,
    required this.title,
    this.func,
    required this.icon,
    this.trailing,
  });
  final IconData icon;
  final String title;
  final Widget? trailing;
  final VoidCallback? func;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: func,
      shape: const Border(
        bottom: BorderSide(
          color: SQColors.borderPrimary,
        ),
      ),
      leading: Icon(
        icon,
        size: 26,
        color: SQColors.black,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      trailing: trailing,
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    super.key,
    this.icon = Icons.arrow_forward_ios_sharp,
    required this.func,
    required this.title,
    required this.value,
  });

  final IconData icon;
  final VoidCallback func;
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: SQSizes.spaceBtwItems / 1.5),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodySmall,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              flex: 5,
              child: Text(
                value,
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              child: Icon(
                icon,
                size: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
