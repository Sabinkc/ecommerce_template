import 'package:ecommerce/features/store/controllers/wishlistcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../widgets/sectionheading.dart';
import '../../../personalization/screen/address/address.dart';
import '../../../personalization/screen/editprofile.dart';
import '../../controllers/ordercontrollers.dart';
import '../orders.dart';
import '../settings/settings.dart';
import '../widgets/profiletile.dart';
import '../wishlist.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final orderController = Get.put(OrderControllers());
    final wishlistController = Get.put(WishlistController());
    final List<Map<String, dynamic>> myorderOptions = [
      {
        "icon": Iconsax.wallet_2_outline,
        "option": "To Pay",
        "func": () {
          orderController.changeTabIndex(1);
          Get.to(() => const OrdersScreen());
        },
      },
      {
        "icon": Iconsax.truck_fast_outline,
        "option": "To Ship",
        "func": () {
          orderController.changeTabIndex(2);
          Get.to(() => const OrdersScreen());
        },
      },
      {
        "icon": Iconsax.box_outline,
        "option": "To Receive",
        "func": () {
          orderController.changeTabIndex(3);
          Get.to(() => const OrdersScreen());
        },
      },
      {
        "icon": Iconsax.undo_outline,
        "option": "All Returns",
        "func": () {
          orderController.changeTabIndex(4);
          Get.to(() => const OrdersScreen());
        },
      },
    ];
    final List<Map<String, dynamic>> otherOptions = [
      {
        "icon": Iconsax.message_outline,
        "option": "Messages",
        "func": () {},
      },
      {
        "icon": Iconsax.send_2_outline,
        "option": "Chat",
        "func": () {},
      },
      {
        "icon": Iconsax.keyboard_outline,
        "option": "My Reviews",
        "func": () {},
      },
      {
        "icon": Iconsax.card_coin_outline,
        "option": "Payment Options",
        "func": () {},
      },
      {
        "icon": Iconsax.info_circle_outline,
        "option": "Help Center",
        "func": () {},
      },
    ];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Profile",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        shape: const Border(
          bottom: BorderSide(color: SQColors.borderSecondary),
        ),
        forceMaterialTransparency: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: SQSizes.md,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.amber,
                      radius: 30,
                      backgroundImage: AssetImage("assets/images/defaultpp.png"),
                    ),
                    const SizedBox(
                      width: SQSizes.md,
                    ),
                    Expanded(
                      child: SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Suman Shrestha",
                              style: Theme.of(context).textTheme.headlineSmall!.apply(
                                    fontWeightDelta: 1,
                                    fontSizeDelta: 3,
                                  ),
                            ),
                            const SizedBox(
                              height: SQSizes.xs,
                            ),
                            Row(
                              children: [
                                InkWell(
                                  overlayColor: WidgetStateColor.transparent,
                                  onTap: () {
                                    Get.to(
                                      () => const WishListScreen(),
                                    );
                                  },
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "${wishlistController.favoriteItems.length}",
                                          style: Theme.of(context).textTheme.bodyLarge!.apply(
                                                color: SQColors.primary,
                                              ),
                                        ),
                                        TextSpan(
                                          text: " Wishlist",
                                          style: Theme.of(context).textTheme.bodyMedium,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: SQSizes.sm,
                                ),
                                Text(
                                  "◆",
                                  style: Theme.of(context).textTheme.bodySmall!.apply(
                                        color: SQColors.darkGrey,
                                      ),
                                ),
                                const SizedBox(
                                  width: SQSizes.sm,
                                ),
                                InkWell(
                                  overlayColor: WidgetStateColor.transparent,
                                  onTap: () {},
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "0",
                                          style: Theme.of(context).textTheme.bodyLarge!.apply(
                                                color: SQColors.primary,
                                              ),
                                        ),
                                        TextSpan(
                                          text: " Voucher",
                                          style: Theme.of(context).textTheme.bodyMedium,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Get.to(
                          () => const SettingScreen(),
                          transition: Transition.rightToLeft,
                        );
                      },
                      icon: const Icon(
                        Iconsax.setting_2_outline,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: SQSizes.md,
                ),
                const Divider(
                  color: SQColors.borderPrimary,
                ),
                const SizedBox(
                  height: SQSizes.xs,
                ),
                SectionHeading(
                  headingTitle: "My Orders",
                  func: () {
                    orderController.changeTabIndex(0);
                    Get.to(
                      () => const OrdersScreen(),
                      transition: Transition.downToUp,
                    );
                  },
                  buttonTitle: "View All Orders",
                ),
                const SizedBox(
                  height: SQSizes.sml,
                ),
                Container(
                  padding: const EdgeInsets.only(
                    bottom: SQSizes.sm,
                  ),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: SQColors.borderPrimary,
                      ),
                    ),
                  ),
                  child: Wrap(
                    children: myorderOptions.map(
                      (entry) {
                        return OrderOptions(
                          optionTitle: entry["option"],
                          icon: entry["icon"],
                          func: entry["func"],
                        );
                      },
                    ).toList(),
                  ),
                ),
                const SizedBox(
                  height: SQSizes.md,
                ),
                SectionHeading(
                  headingTitle: "Account Information",
                  func: () {},
                  showButton: false,
                ),
                SQProfileTile(
                  icon: Iconsax.edit_2_outline,
                  title: "Edit Profile",
                  subtitle: "Edit your details here.",
                  onTap: () => Get.to(
                    () => const EditProfileScreen(),
                  ),
                ),
                SQProfileTile(
                  icon: Iconsax.archive_book_outline,
                  title: "Address Book",
                  subtitle: "Manage your address here.",
                  onTap: () => Get.to(
                    () => const AddressScreen(),
                  ),
                ),
                const SizedBox(
                  height: SQSizes.md,
                ),
                SectionHeading(
                  headingTitle: "Others",
                  showButton: false,
                  func: () {},
                ),
                const SizedBox(
                  height: SQSizes.md,
                ),
                SizedBox(
                  width: size.width,
                  child: Wrap(
                    children: otherOptions.map(
                      (entry) {
                        return OrderOptions(
                          optionTitle: entry["option"],
                          icon: entry["icon"],
                          func: () {},
                        );
                      },
                    ).toList(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
