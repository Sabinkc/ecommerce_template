import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import '../../../../utils/constants/colors.dart';

class EmptyWishlistContainer extends StatelessWidget {
  const EmptyWishlistContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(
          Iconsax.heart_bold,
          color: SQColors.primary,
          size: 100,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "You currently have nothing saved in your wishlist.",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ],
    );
  }
}
