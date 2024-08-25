import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/common/widgets/elevatedbutton.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import '../../../../utils/constants/colors.dart';
import 'widget/reviewitemcontainer.dart';

class ReviewProductScreen extends StatelessWidget {
  /// Through this screen, User can add review to the product.
  /// User can rate the product, write a review and add upto 3 images.
  const ReviewProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: const [
        GestureType.onTap,
        GestureType.onPanUpdateAnyDirection,
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Review Product",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          shape: const Border(
            bottom: BorderSide(color: SQColors.borderSecondary),
          ),
          forceMaterialTransparency: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("How was your item?"),
              const SizedBox(
                height: SQSizes.sm,
              ),
              const ReviewItemContainer(),
              const SizedBox(
                height: SQSizes.sm,
              ),
              const Divider(
                color: SQColors.borderPrimary,
              ),
              const SizedBox(
                height: SQSizes.sm,
              ),
              const Text("Write your review:"),
              const SizedBox(
                height: SQSizes.xs,
              ),
              SizedBox(
                height: 200,
                child: Card(
                  color: SQColors.softGrey,
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: const Padding(
                    padding: EdgeInsets.all(15),
                    child: TextField(
                      maxLength: 250,
                      maxLines: 8, //or null
                      decoration: InputDecoration.collapsed(hintText: "Enter your review here"),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: SQSizes.sm,
              ),
              const Divider(
                color: SQColors.borderPrimary,
              ),
              const SizedBox(
                height: SQSizes.sm,
              ),
              const Text("Images:"),
              const SizedBox(
                height: SQSizes.sm,
              ),
              Row(
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/iphonecases/iphone15_1.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: 90,
                    height: 90,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/iphonecases/iphone15_1.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: 90,
                    height: 90,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: Colors.cyanAccent,
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/iphonecases/iphone15_1.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: SQSizes.sm,
              ),
              const Divider(
                color: SQColors.borderPrimary,
              ),
              const SizedBox(
                height: SQSizes.sm,
              ),
              Row(
                children: [
                  const Icon(Icons.camera_alt_outlined),
                  const SizedBox(
                    width: SQSizes.xs,
                  ),
                  Expanded(
                    child: InkWell(
                      overlayColor: WidgetStateColor.transparent,
                      onTap: () {},
                      child: const Text(
                        "Add Photos",
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: SQSizes.md,
                  ),
                  SizedBox(
                    width: 200,
                    child: SQElevatedButton(func: () {}, title: "SUBMIT"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
