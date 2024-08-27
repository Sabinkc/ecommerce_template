import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:icons_plus/icons_plus.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../common/widgets/sqgridlayout.dart';
import 'controllers/cartcontrollers.dart';
import '../../../model/products.dart';
import 'widgets/cartitemcontainer.dart';
import 'widgets/totalpriceandcheckoutcontainer.dart';
import 'widgets/discountvouchercontainer.dart';
import 'widgets/emptycartcontainer.dart';

class CartScreen extends StatelessWidget {
  /// Cart Screen thru where user can check select or delete items.
  /// Also have recommendation products.
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartControllers = Get.put(CartControllers());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text(
          "My Cart",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        shape: const Border(
          bottom: BorderSide(color: SQColors.borderSecondary),
        ),
        forceMaterialTransparency: true,
        actions: [
          Text(
            "Select all",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Center(
            child: SizedBox(
              width: 45,
              height: 45,
              child: Obx(
                () => GFCheckbox(
                  type: GFCheckboxType.basic,
                  size: 22,
                  onChanged: (value) {
                    cartControllers.selectAllItems();
                  },
                  value: cartControllers.selectAll.value,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: SQSizes.xs,
          ),
        ],
      ),
      bottomSheet: Obx(
        () => cartControllers.selectedCartItems.isNotEmpty ? const TotalPriceAndCheckoutContainer() : const SizedBox.shrink(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DiscountVoucherContainter(),
              const SizedBox(
                height: SQSizes.sml,
              ),
              Obx(
                () => cartControllers.allCartItems.isNotEmpty
                    ? ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: cartControllers.allCartItems.map(
                          (items) {
                            return Slidable(
                              key: UniqueKey(),
                              endActionPane: ActionPane(
                                extentRatio: 0.3,
                                motion: const ScrollMotion(),
                                children: [
                                  Flexible(
                                    child: InkWell(
                                      overlayColor: WidgetStateColor.transparent,
                                      onTap: () {
                                        cartControllers.removeItemFromCart(items["cartItemId"]);
                                      },
                                      child: Container(
                                        width: 150,
                                        height: 160,
                                        margin: const EdgeInsets.only(left: 10),
                                        color: Colors.red,
                                        child: const Icon(
                                          Iconsax.trash_outline,
                                          color: Colors.white,
                                          size: 27,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              child: CartItemContainer(cartItemDetails: items),
                            );
                          },
                        ).toList(),
                      )
                    : const EmptyCartContainer(),
              ),
              const SizedBox(
                height: SQSizes.sml,
              ),
              const Divider(),
              const SizedBox(
                height: SQSizes.sm,
              ),
              const Align(
                alignment: Alignment.center,
                child: Text("You might like to fill it with"),
              ),
              const SizedBox(
                height: SQSizes.md,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: SQGridLayout(
                    allproducts: products,
                  )),
              Obx(
                () => cartControllers.selectedCartItems.isNotEmpty
                    ? const SizedBox(
                        height: 100,
                      )
                    : const SizedBox(
                        height: SQSizes.md,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
