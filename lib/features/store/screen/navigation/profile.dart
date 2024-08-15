import 'package:ecommerce/features/store/screen/navigation/home.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import '../../../../utils/constants/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final List<Map<String, dynamic>> myorderOptions = [
      {
        "icon": Iconsax.wallet_2_outline,
        "option": "To Pay",
        "func": () {},
      },
      {
        "icon": Iconsax.truck_fast_outline,
        "option": "To Ship",
        "func": () {},
      },
      {
        "icon": Iconsax.box_1_outline,
        "option": "To Receive",
        "func": () {},
      },
      {
        "icon": Iconsax.redo_outline,
        "option": "All Returns",
        "func": () {},
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
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "1",
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
                              RichText(
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
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // Get.to(
                      //   () => const SettingScreen(),
                      //   transition: Transition.rightToLeft,
                      // );
                    },
                    child: const Icon(
                      Iconsax.setting_2_outline,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: SQSizes.lg,
              ),
              SectionHeading(
                headingTitle: "My Orders",
                func: () {},
                buttonTitle: "View All Orders",
              ),
              const SizedBox(
                height: SQSizes.md,
              ),
              Wrap(
                children: myorderOptions.map(
                  (entry) {
                    return OrderOptions(
                      optionTitle: entry["option"],
                      icon: entry["icon"],
                      func: () {},
                    );
                  },
                ).toList(),
              ),
              const SizedBox(
                height: SQSizes.md,
              ),
              SectionHeading(
                headingTitle: "Other Options",
                showButton: false,
                func: () {},
              ),
              const SizedBox(
                height: SQSizes.md,
              ),
              Container(
                width: size.width,
                height: size.height * 0.3,
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
