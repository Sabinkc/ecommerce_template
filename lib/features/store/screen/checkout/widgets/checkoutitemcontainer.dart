import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../model/functions.dart';

class CheckoutItemContainer extends StatelessWidget {
  /// Checkout item container which takes item variables and display them.
  const CheckoutItemContainer({
    super.key,
    required this.imagelink,
    required this.productTitle,
    required this.productPrice,
    required this.productSpec,
    required this.productQty,
    required this.selectedColor,
  });

  final String imagelink, productTitle, productSpec, productQty;
  final int productPrice;
  final Color selectedColor;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        //color: Colors.amber,
        border: Border.all(
          color: SQColors.borderSecondary,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            width: 130,
            height: 130,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(imagelink),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: SQSizes.sml,
          ),
          Flexible(
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productTitle,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(
                    height: SQSizes.xs,
                  ),
                  Text(
                    "Rs ${formatNumber(productPrice)}",
                    style: Theme.of(context).textTheme.titleSmall!.apply(
                          color: SQColors.primary,
                        ),
                  ),
                  const SizedBox(
                    height: SQSizes.sm,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: selectedColor,
                        ),
                      ),
                      const SizedBox(
                        width: SQSizes.md,
                      ),
                      productSpec.isNotEmpty
                          ? Container(
                              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                              decoration: BoxDecoration(
                                border: Border.all(width: 1, color: SQColors.borderPrimary),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                productSpec,
                                style: Theme.of(context).textTheme.labelSmall!.apply(
                                      color: Colors.black,
                                      fontWeightDelta: 1,
                                    ),
                              ),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                  const SizedBox(
                    height: SQSizes.sm,
                  ),
                  Text(
                    "Qty: $productQty",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
