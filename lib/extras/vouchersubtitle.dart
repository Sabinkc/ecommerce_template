import 'package:flutter/material.dart';
import '../utils/constants/colors.dart';

class VoucherSubtitle extends StatelessWidget {
  const VoucherSubtitle({
    super.key,
    required this.subtitle,
  });

  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "- ",
              style: Theme.of(context).textTheme.headlineSmall!.apply(
                    color: SQColors.darkerGrey,
                  ),
            ),
            TextSpan(
              text: subtitle,
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: SQColors.darkerGrey,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
