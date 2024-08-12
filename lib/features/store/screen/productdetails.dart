import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../widgets/elevatedbutton.dart';
import '../../../widgets/imagecarousel.dart';
import '../controllers/wishlistcontroller.dart';
import '../model/functions.dart';
import 'navigation/productdetailscontroller.dart';
import 'widgets/specifications.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({
    super.key,
    required this.productDetails,
  });

  final Map productDetails;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final imageController = PageController();
    final productdetailsController = Get.put(ProductDetailsController());
    final wishlistController = Get.put(WishlistController());
    final String description = productDetails["desc"];
    final Map specifications = productDetails["specifications"] ?? {};
    void onSpecificationClicked() {
      showModalBottomSheet(
        //isScrollControlled: true,
        enableDrag: false,
        context: context,
        builder: (context) => SpecificationsScreen(
          specificationDetails: specifications,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Product Details",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        shape: const Border(
          bottom: BorderSide(color: SQColors.borderSecondary),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Obx(
              () => IconButton(
                onPressed: () {
                  wishlistController.addToWishList(productDetails["productId"]);
                },
                icon: Icon(
                  wishlistController.isFav(productDetails["productId"]) ? Iconsax.heart_bold : Iconsax.heart_outline,
                  color: SQColors.primary,
                  size: 25,
                ),
              ),
            ),
          ),
        ],
        forceMaterialTransparency: true,
      ),
      bottomSheet: Container(
        width: size.width,
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              color: SQColors.borderPrimary,
              width: 1,
            ),
          ),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Rs ",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      TextSpan(
                        text: productDetails["discount"] ? formatNumber(productDetails["discountedPrice"]) : formatNumber(productDetails["productPrice"]),
                        style: Theme.of(context).textTheme.headlineSmall!.apply(
                              fontSizeDelta: 5,
                              color: SQColors.primary,
                            ),
                      ),
                      TextSpan(
                        text: ".00",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ],
                  ),
                ),
                productDetails["discount"]
                    ? Text(
                        "Rs ${formatNumber(productDetails["productPrice"])}",
                        style: const TextStyle(
                          decorationThickness: 5,
                          fontSize: 12,
                          color: SQColors.darkerGrey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      )
                    : const SizedBox.shrink(),
                const SizedBox(
                  height: SQSizes.xs,
                ),
                Text(
                  "Delivery 2-3 days",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
            const SizedBox(
              width: SQSizes.lg,
            ),
            Flexible(
              child: SizedBox(
                height: 45,
                child: SQElevatedButton(
                    func: () {
                      onCartClicked(productDetails);
                    },
                    title: "Add to Cart"),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageCarousel(
                imageController: imageController,
                images: productDetails["image"],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Category: ${productDetails["category"]}",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    const SizedBox(
                      height: SQSizes.sm,
                    ),
                    Obx(
                      () => Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              productDetails["productName"],
                              style: Theme.of(context).textTheme.headlineSmall,
                              overflow: TextOverflow.ellipsis,
                              maxLines: productdetailsController.istitleExpanded.value ? 3 : 1,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              productdetailsController.changetitleExpanded();
                            },
                            overlayColor: WidgetStateColor.transparent,
                            child: Icon(
                              productdetailsController.istitleExpanded.value ? Icons.keyboard_arrow_up_sharp : Icons.keyboard_arrow_down_sharp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: SQSizes.md,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          color: Colors.amber,
                        ),
                        const SizedBox(
                          width: SQSizes.sm,
                        ),
                        Text(
                          "4.1",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(
                          width: SQSizes.xs,
                        ),
                        Text(
                          "100 Reviews",
                          style: Theme.of(context).textTheme.labelMedium!.apply(
                                color: SQColors.primary,
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: SQSizes.xs,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Icon(
                          Iconsax.like_1_bold,
                          color: Colors.amber,
                        ),
                        const SizedBox(
                          width: SQSizes.sm,
                        ),
                        Text(
                          "50%",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(
                          width: SQSizes.xs,
                        ),
                        Text(
                          "(50) recommend this",
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: SQSizes.md,
                    ),
                    Text(
                      "Description",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: SQSizes.sm,
                    ),
                    Obx(
                      () => RichText(
                        text: TextSpan(
                          text: productdetailsController.isdescExpanded.value
                              ? description
                              : description.length > 100
                                  ? '${description.substring(0, 120)}...'
                                  : description,
                          style: Theme.of(context).textTheme.labelLarge,
                          children: [
                            TextSpan(
                              text: description.length > 120
                                  ? productdetailsController.isdescExpanded.value
                                      ? " Show Less"
                                      : " Read More"
                                  : "",
                              style: Theme.of(context).textTheme.labelLarge!.apply(color: SQColors.primary),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  productdetailsController.changedescExpanded();
                                },
                            ),
                          ],
                        ),
                        textAlign: TextAlign.justify,
                        maxLines: productdetailsController.isdescExpanded.value ? null : 4,
                        overflow: productdetailsController.isdescExpanded.value ? TextOverflow.visible : TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(
                      height: SQSizes.md,
                    ),
                    specifications.isNotEmpty
                        ? ProductDetailsOptionContainer(
                            title: "Specifications",
                            leadingIcon: Iconsax.cpu_setting_outline,
                            func: onSpecificationClicked,
                          )
                        : const SizedBox.shrink(),
                    ProductDetailsOptionContainer(
                      title: "Reviews",
                      leadingIcon: Iconsax.keyboard_outline,
                      func: () {},
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProductDetailsOptionContainer extends StatelessWidget {
  const ProductDetailsOptionContainer({
    super.key,
    required this.title,
    required this.leadingIcon,
    required this.func,
  });

  final String title;
  final IconData leadingIcon;
  final VoidCallback func;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: func,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        width: size.width,
        height: size.width * 0.12,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: SQColors.borderSecondary,
              width: 2,
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              leadingIcon,
              size: 22,
            ),
            const SizedBox(
              width: SQSizes.sml,
            ),
            Expanded(
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            const Icon(Icons.keyboard_arrow_right_rounded),
          ],
        ),
      ),
    );
  }
}

/**
 * 
 *   productDetails["discount"]
? Container(
padding: const EdgeInsets.all(2),
decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(5),
  color: const Color.fromARGB(108, 255, 182, 72),
),
child: Text(
  "-12%",
  style: Theme.of(context).textTheme.labelMedium!.apply(
        color: Colors.red,
      ),
),
 )
 : const SizedBox.shrink(),
 */