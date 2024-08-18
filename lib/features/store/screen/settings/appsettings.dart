import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import '../../../../utils/constants/colors.dart';

class AppSettings extends StatelessWidget {
  const AppSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "App Settings",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        shape: const Border(
          bottom: BorderSide(color: SQColors.borderSecondary),
        ),
        forceMaterialTransparency: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
          ),
          child: Column(
            children: [
              AppSettingsTile(
                leading: const Icon(
                  Iconsax.language_square_outline,
                  size: 26,
                  color: SQColors.black,
                ),
                title: "Language",
                func: () {},
              ),
              const SizedBox(
                height: SQSizes.xs,
              ),
              AppSettingsTile(
                leading: const Icon(
                  Bootstrap.sun,
                  size: 26,
                  color: SQColors.black,
                ),
                title: "Dark Mode",
                trailing: Switch(
                  value: true,
                  onChanged: (value) {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppSettingsTile extends StatelessWidget {
  const AppSettingsTile({
    super.key,
    required this.title,
    this.trailing,
    this.leading,
    this.func,
  });

  final String title;

  final Widget? leading, trailing;
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
      leading: leading,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      trailing: SizedBox(
        width: 60,
        height: 40,
        child: FittedBox(
          fit: BoxFit.contain,
          child: trailing,
        ),
      ),
    );
  }
}
