import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../../utils/constants/sizes.dart';

class EmptyCartContainer extends StatelessWidget {
  const EmptyCartContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            CupertinoIcons.shopping_cart,
            size: 80,
          ),
          const SizedBox(
            height: SQSizes.sml,
          ),
          Text(
            "Your Cart is Empty.",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(
            height: SQSizes.xs,
          ),
          Text(
            "Please add a few items.",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}
