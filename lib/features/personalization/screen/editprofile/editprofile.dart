import 'package:ecommerce/features/authentication/screen/changepassword.dart';
import 'package:ecommerce/features/personalization/screen/editprofile/alledit.dart';
import 'package:ecommerce/features/personalization/screen/editprofile/selectbirthday.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class EditProfileScreen extends StatelessWidget {
  /// User can view all their details along with their profile picture
  /// and click on each to edit them.
  /// They can also navigate to change password screen thru this screen.
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        shape: const Border(
          bottom: BorderSide(color: SQColors.borderSecondary),
        ),
        centerTitle: true,
        title: Text(
          "Edit Profile",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: SQColors.primary,
                    width: 2,
                    strokeAlign: BorderSide.strokeAlignCenter,
                  ),
                ),
                child: Container(
                  height: size.width * 0.26,
                  width: size.width * 0.26,
                  decoration: const BoxDecoration(
                    color: SQColors.accent,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("assets/images/defaultpp.png"),
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "CHANGE AVATAR",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const Divider(),
              ProfileMenu(
                func: () => Get.to(
                  () => const EditUserScreen(
                    title: "Full Name",
                    subtitle: "name",
                    hintText: "Suman Shrestha",
                  ),
                ),
                title: "Full Name",
                value: "Suman Shrestha",
              ),
              ProfileMenu(
                func: () => Get.to(
                  () => const EditUserScreen(
                    title: "Phone Number",
                    subtitle: "number",
                    hintText: "9818167498",
                  ),
                ),
                title: "Phone Number",
                value: "9818167498",
              ),
              ProfileMenu(
                func: () {},
                title: "Email",
                value: "sumansthahope@gmail.com",
              ),
              ProfileMenu(
                func: () {},
                title: "Gender",
                value: "Male",
              ),
              ProfileMenu(
                func: () {
                  Get.to(
                    () => const SelectBirthdayScreen(),
                  );
                },
                title: "Birthday",
                value: "02 Oct, 2002",
              ),
              ProfileMenu(
                func: () {
                  Get.to(
                    () => const ChangePasswordScreen(),
                  );
                },
                title: "Change Password",
                value: "",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    super.key,
    this.icon = Icons.arrow_forward_ios_sharp,
    required this.func,
    required this.title,
    required this.value,
  });

  final IconData icon;
  final VoidCallback func;
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
        ),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: SQColors.borderPrimary,
              width: 2,
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodySmall,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              value,
              style: Theme.of(context).textTheme.bodyLarge,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              width: SQSizes.sm,
            ),
            Icon(
              icon,
              size: 15,
            ),
          ],
        ),
      ),
    );
  }
}
