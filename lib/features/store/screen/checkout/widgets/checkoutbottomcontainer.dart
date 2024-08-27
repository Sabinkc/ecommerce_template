import 'package:ecommerce/features/store/screen/checkout/widgets/addvoucher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import '../../../../../common/widgets/elevatedbutton.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../orders/ordersuccess.dart';

class CheckoutBottomContainer extends StatelessWidget {
  /// Through this Widget user can add voucher code and place order.
  /// It is in Checkout Screen
  const CheckoutBottomContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: SQColors.borderPrimary, width: 1),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 18),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                enableDrag: true,
                context: context,
                builder: (context) => const AddVoucherScreen(),
              );
            },
            child: Row(
              children: [
                const Icon(
                  Iconsax.ticket_bold,
                  color: SQColors.primary,
                ),
                const SizedBox(
                  width: SQSizes.sml,
                ),
                Expanded(
                  child: Text(
                    "Voucher",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                Text(
                  "Click to add",
                  style: Theme.of(context).textTheme.bodySmall!.apply(
                        color: SQColors.textPrimary,
                      ),
                ),
                const SizedBox(
                  width: SQSizes.sml,
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 15,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: SQSizes.sml,
          ),
          const Divider(),
          const SizedBox(
            height: SQSizes.sml,
          ),
          SQElevatedButton(
            func: () {
              Get.to(() => const OrderSuccessScreen());
            },
            title: "Place Order",
          ),
        ],
      ),
    );
  }
}
