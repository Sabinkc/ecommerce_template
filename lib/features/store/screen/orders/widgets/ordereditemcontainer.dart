import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../orderdetails.dart';

class OrderedItemContainer extends StatelessWidget {
  const OrderedItemContainer({
    super.key,
    required this.placedDate,
    required this.orderNo,
    required this.imageLink,
    required this.productTitle,
    required this.quantityNo,
    required this.orderStatus,
    required this.deliveredBy,
  });

  final String placedDate, orderNo, imageLink, productTitle, quantityNo, orderStatus, deliveredBy;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      overlayColor: WidgetStateColor.transparent,
      onTap: () => Get.to(
        () => OrderDetailsScreen(
          orderStatus: orderStatus,
        ),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 5,
        ),
        padding: const EdgeInsets.all(
          10,
        ),
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            width: 1,
            color: SQColors.borderPrimary,
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Placed on: ",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      TextSpan(
                        text: placedDate,
                        style: Theme.of(context).textTheme.labelLarge!.apply(
                              fontWeightDelta: 1,
                            ),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Order no: ",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      TextSpan(
                        text: orderNo,
                        style: Theme.of(context).textTheme.labelLarge!.apply(
                              fontWeightDelta: 1,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: SQSizes.sml,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    image: DecorationImage(
                      image: AssetImage(imageLink),
                    ),
                  ),
                ),
                const SizedBox(
                  width: SQSizes.sml,
                ),
                Flexible(
                  child: SizedBox(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            productTitle,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        const SizedBox(
                          height: SQSizes.sm,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Quantity: ",
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                              TextSpan(
                                text: quantityNo,
                                style: Theme.of(context).textTheme.labelLarge!.apply(
                                      fontWeightDelta: 1,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: SQSizes.sm,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: SQColors.primary,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            orderStatus,
                            style: Theme.of(context).textTheme.labelLarge!.apply(
                                  color: Colors.white,
                                ),
                          ),
                        ),
                        const SizedBox(
                          height: SQSizes.sm,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Delivery By: ",
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                              TextSpan(
                                text: deliveredBy,
                                style: Theme.of(context).textTheme.labelLarge!.apply(
                                      fontWeightDelta: 1,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
