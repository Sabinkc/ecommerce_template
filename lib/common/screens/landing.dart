import 'package:ecommerce/common/controllers/landingcontroller.dart';
import 'package:ecommerce/features/store/screen/navigation/cart.dart';
import 'package:ecommerce/features/store/screen/navigation/category.dart';
import 'package:ecommerce/features/store/screen/navigation/profile.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../features/store/screen/navigation/home.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final landingcontroller = Get.put(LandingScreenController());
    final List<Widget> pages = [
      const HomeScreen(),
      const CategoryScreen(),
      const CartScreen(),
      const ProfileScreen(),
    ];
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Obx(() => pages[landingcontroller.index.value]),
      bottomNavigationBar: Obx(
        () => SizedBox(
          width: size.width,
          height: size.height * 0.1,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            backgroundColor: Colors.white,
            iconSize: 22,
            selectedItemColor: SQColors.primary,
            unselectedItemColor: SQColors.textSecondary,
            currentIndex: landingcontroller.index.value,
            onTap: (value) {
              landingcontroller.changeindex(value);
            },
            items: const [
              BottomNavigationBarItem(
                activeIcon: Icon(Iconsax.home_bold),
                icon: Icon(Iconsax.home_1_outline),
                label: "Home",
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(Iconsax.category_bold),
                icon: Icon(Iconsax.category_outline),
                label: "Category",
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.shopping_cart),
                icon: Icon(Icons.shopping_cart_outlined),
                label: "Cart",
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(Iconsax.user_bold),
                icon: Icon(Iconsax.user_outline),
                label: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
