import 'package:dotted_line/dotted_line.dart';
import 'package:ecommerce/common/widgets/elevatedbutton.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:ticket_clippers/ticket_clippers.dart';
import '../../../../utils/constants/colors.dart';

class VoucherScreen extends StatelessWidget {
  const VoucherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Voucher",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        shape: const Border(
          bottom: BorderSide(color: SQColors.borderSecondary),
        ),
        forceMaterialTransparency: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        child: Column(
          children: [
            VoucherOneContainer(
              discountPerc: "15",
              extras: "No min Spend",
              content: "Free Shipping",
              content1: "Selected Products",
              date: "Valid till: 31 Aug, 11:59 PM",
              func: () {},
            ),
            const SizedBox(
              height: SQSizes.md,
            ),
            VoucherOneContainer(
              discountPerc: "5",
              extras: "",
              content1: "Only for Phonecases",
              content: "",
              date: "Valid till: 31 Aug, 11:59 PM",
              func: () {},
            ),
            const SizedBox(
              height: SQSizes.spaceBtwSections,
            ),
            VoucherContainer(
              discountperc: "15",
              subtitles: const [
                "Free Shipping",
                "Only Selected Products",
                "Vaid Till 31, Aug.",
              ],
              func: () {},
              notes: "This voucher is a token of our gratitude for joining us. Your support is helping us shape the future of e-commerce.",
            ),
            const SizedBox(
              height: SQSizes.md,
            ),
            VoucherContainer(
              discountperc: "5",
              subtitles: const [
                "Only For Phonecases",
                "Vaid Till 31, Aug.",
              ],
              func: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class VoucherOneContainer extends StatelessWidget {
  const VoucherOneContainer({
    super.key,
    required this.discountPerc,
    required this.extras,
    required this.content,
    required this.content1,
    required this.date,
    required this.func,
  });

  final String discountPerc, extras, content, content1, date;
  final VoidCallback func;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Slidable(
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
                height: 290,
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
      child: InkWell(
        onTap: func,
        child: ClipPath(
          clipper: TicketRoundedEdgeClipper(
            edge: Edge.vertical,
            position: 150,
            radius: 15,
          ),
          child: Container(
            width: size.width,
            height: 125,
            decoration: BoxDecoration(
              color: SQColors.primary.withOpacity(0.15),
              border: Border.all(color: SQColors.primary),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Container(
                  width: 145,
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: discountPerc,
                              style: Theme.of(context).textTheme.headlineLarge!.apply(
                                    color: SQColors.black,
                                  ),
                            ),
                            TextSpan(
                              text: " % off",
                              style: Theme.of(context).textTheme.titleMedium!.apply(
                                    color: SQColors.black,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        extras,
                        style: Theme.of(context).textTheme.bodyMedium!.apply(
                              color: SQColors.black,
                            ),
                      ),
                    ],
                  ),
                ),
                DottedLine(
                  direction: Axis.vertical,
                  dashColor: SQColors.black.withOpacity(0.3),
                  dashLength: 5,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          content,
                          style: Theme.of(context).textTheme.titleMedium!.apply(
                                color: SQColors.darkerGrey,
                              ),
                        ),
                        Text(
                          content1,
                          style: Theme.of(context).textTheme.labelLarge!.apply(
                                color: SQColors.darkerGrey,
                              ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: SQColors.primary.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "T&C",
                            style: Theme.of(context).textTheme.labelMedium!.apply(
                                  color: SQColors.primary,
                                ),
                          ),
                        ),
                        Text(
                          date,
                          style: Theme.of(context).textTheme.labelMedium!.apply(
                                color: SQColors.black,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class VoucherContainer extends StatelessWidget {
  const VoucherContainer({
    super.key,
    required this.discountperc,
    this.notes = "",
    this.extra = "",
    required this.subtitles,
    required this.func,
  });

  final String discountperc;
  final String notes, extra;
  final List<String> subtitles;
  final VoidCallback func;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Slidable(
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
                height: 290,
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
      child: Container(
        width: size.width,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: SQColors.borderPrimary,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: discountperc,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      TextSpan(
                        text: " % off",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      TextSpan(
                        text: ", $extra",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: SQColors.primary.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "T&C",
                    style: Theme.of(context).textTheme.labelMedium!.apply(
                          color: SQColors.primary,
                        ),
                  ),
                ),
              ],
            ),
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: subtitles
                  .map(
                    (option) => VoucherSubtitle(subtitle: option),
                  )
                  .toList(),
            ),
            const SizedBox(
              height: SQSizes.sm,
            ),
            notes.isNotEmpty
                ? Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: SQColors.softGrey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      notes,
                      style: Theme.of(context).textTheme.labelLarge!.apply(
                            color: SQColors.darkerGrey,
                          ),
                    ),
                  )
                : const SizedBox.shrink(),
            const SizedBox(
              height: SQSizes.md,
            ),
            SQElevatedButton(
              func: func,
              title: "Use Voucher",
            ),
          ],
        ),
      ),
    );
  }
}

class VoucherSubtitle extends StatelessWidget {
  const VoucherSubtitle({
    super.key,
    required this.subtitle,
  });

  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "- ",
              style: Theme.of(context).textTheme.headlineSmall!.apply(
                    color: SQColors.darkerGrey,
                  ),
            ),
            TextSpan(
              text: subtitle,
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: SQColors.darkerGrey,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
