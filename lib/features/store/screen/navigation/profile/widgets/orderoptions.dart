import 'package:flutter/material.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';

class OrderOptions extends StatelessWidget {
  const OrderOptions({
    super.key,
    required this.optionTitle,
    required this.icon,
    required this.func,
  });
  final String optionTitle;
  final IconData icon;
  final VoidCallback func;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: func,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        width: size.width * 0.23,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 30,
              color: SQColors.primary,
            ),
            const SizedBox(
              height: SQSizes.sm,
            ),
            Text(
              optionTitle,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
