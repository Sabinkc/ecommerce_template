import 'package:ecommerce/features/personalization/screen/address/addaddress.dart';
import 'package:ecommerce/features/personalization/screen/address/editaddress.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import '../../../../utils/constants/sizes.dart';
import 'widget/addresscontainer.dart';

class AddressScreen extends StatelessWidget {
  /// Through this screen view their address.
  /// User can add new address by clicking floating action button
  /// And to edit user can simply click Edit Button
  const AddressScreen({super.key});

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
          "My Address",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      floatingActionButton: SizedBox(
        height: size.height * 0.08,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () => Get.to(
              () => const AddAddressScreen(),
            ),
            backgroundColor: SQColors.primary,
            child: const Icon(
              Iconsax.add_outline,
              size: 30,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Center(
            child: Column(
              children: [
                Slidable(
                  endActionPane: ActionPane(
                    extentRatio: 0.3,
                    motion: const ScrollMotion(),
                    children: [
                      Flexible(
                        child: InkWell(
                          overlayColor: WidgetStateColor.transparent,
                          onTap: () {},
                          child: Container(
                            width: 150,
                            height: 180,
                            margin: const EdgeInsets.only(left: 10),
                            color: Colors.red,
                            child: const Icon(
                              Iconsax.trash_outline,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  child: AddressContainer(
                    fullname: "Suman Shrestha",
                    phoneno: "9818167498",
                    municipality: "Budanilkantha",
                    street: "Chunikhel",
                    landmark: "Karuna Hospital",
                    place: "HOME",
                    defaultShipping: true,
                    func: () => Get.to(
                      () => const EditAddressScreen(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: SQSizes.md,
                ),
                AddressContainer(
                  fullname: "Suman Shrestha",
                  phoneno: "9818167498",
                  municipality: "Kathmandu",
                  street: "Shankhamul",
                  landmark: "Shankhamul Health Care",
                  place: "OFFICE",
                  defaultShipping: false,
                  func: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
