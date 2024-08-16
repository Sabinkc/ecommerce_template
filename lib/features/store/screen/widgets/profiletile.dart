import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';

class SQProfileTile extends StatelessWidget {
  const SQProfileTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.trailing,
    this.onTap,
  });

  final IconData icon;
  final String title, subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: const Border(
        bottom: BorderSide(
          color: SQColors.borderPrimary,
        ),
      ),
      leading: Icon(
        icon,
        size: 28,
        color: SQColors.black,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.bodySmall,
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
