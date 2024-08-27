import 'package:ecommerce/common/widgets/sqgridlayout.dart';
import 'package:ecommerce/common/widgets/textfield.dart';
import 'package:ecommerce/features/store/model/products.dart';
import 'package:ecommerce/features/store/screen/search/controllers/searchcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/colors.dart';
import '../filter/filter.dart';

class SearchResultScreen extends StatelessWidget {
  const SearchResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchControllers());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        forceMaterialTransparency: true,
        title: SizedBox(
          height: 45,
          child: SQTextField(
            controller: controller.search,
            hinttext: "Phonecase",
          ),
        ),
        shape: const Border(
          bottom: BorderSide(color: SQColors.borderSecondary),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => const FilterScreen(),
              );
            },
            icon: const Icon(
              Icons.sort,
              color: Colors.black,
              size: 30,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            SQGridLayout(
              allproducts: products,
            ),
          ],
        ),
      ),
    );
  }
}
