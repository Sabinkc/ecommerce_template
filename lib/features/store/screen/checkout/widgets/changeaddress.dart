import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../personalization/screen/address/widget/addresscontainer.dart';

class ChangeAddressScreen extends StatelessWidget {
  const ChangeAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Change Address",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        shape: const Border(
          bottom: BorderSide(color: SQColors.borderSecondary),
        ),
        centerTitle: false,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.close_outlined,
              size: 30,
            ),
          ),
        ],
        forceMaterialTransparency: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: Column(
          children: [
            AddressContainer(
              fullname: "Suman Shrestha",
              phoneno: "9818167498",
              municipality: "Budanilkantha",
              street: "Chunikhel",
              landmark: "Karuna Hospital",
              place: "HOME",
              defaultShipping: true,
              func: () {},
            ),
            const SizedBox(
              height: SQSizes.sml,
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
    );
  }
}
