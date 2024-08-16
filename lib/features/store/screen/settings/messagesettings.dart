import 'package:ecommerce/features/store/screen/navigation/home.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';

class MessageSettings extends StatelessWidget {
  const MessageSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Message Settings",
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
              const SizedBox(
                height: SQSizes.md,
              ),
              SectionHeading(
                headingTitle: "App Notifications",
                func: () {},
                showButton: false,
              ),
              const SizedBox(
                height: SQSizes.xs,
              ),
              MessageSettingsTile(
                title: "Activities",
                trailing: Switch(
                  value: true,
                  onChanged: (value) {},
                ),
                subtitle: 'Updates on price drop, Feed and other in app events',
              ),
              const SizedBox(
                height: SQSizes.xs,
              ),
              MessageSettingsTile(
                title: "Promotions",
                subtitle: "Be the first to find out about upcoming deals",
                trailing: Switch(
                  value: true,
                  onChanged: (value) {},
                ),
              ),
              const SizedBox(
                height: SQSizes.xs,
              ),
              MessageSettingsTile(
                title: "Orders",
                subtitle: 'Get the latest status on your order',
                trailing: Switch(
                  value: true,
                  onChanged: (value) {},
                ),
              ),
              const SizedBox(
                height: SQSizes.xs,
              ),
              MessageSettingsTile(
                title: "Chat",
                subtitle: "Get notified when you receive a private chat message",
                trailing: Switch(
                  value: true,
                  onChanged: (value) {},
                ),
              ),
              const SizedBox(
                height: SQSizes.md,
              ),
              SectionHeading(
                headingTitle: "Other Channels",
                func: () {},
                showButton: false,
              ),
              const SizedBox(
                height: SQSizes.xs,
              ),
              MessageSettingsTile(
                title: "Email",
                subtitle: "Receive our E-newsletter and handpicked recommendations via email",
                trailing: Switch(
                  value: false,
                  onChanged: (value) {},
                ),
              ),
              const SizedBox(
                height: SQSizes.xs,
              ),
              MessageSettingsTile(
                title: "SMS",
                trailing: Switch(
                  value: false,
                  onChanged: (c) {},
                ),
                subtitle: "Receive our extra special, not-to-be missed offers via SMS",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MessageSettingsTile extends StatelessWidget {
  const MessageSettingsTile({
    super.key,
    required this.title,
    this.trailing,
    this.func,
    required this.subtitle,
  });

  final String title;
  final String subtitle;
  final Widget? trailing;
  final VoidCallback? func;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      onTap: func,
      shape: const Border(
        bottom: BorderSide(
          color: SQColors.borderPrimary,
        ),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.labelMedium,
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
