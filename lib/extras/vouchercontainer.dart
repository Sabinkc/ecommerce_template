import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:icons_plus/icons_plus.dart';
import '../common/widgets/elevatedbutton.dart';
import '../utils/constants/colors.dart';
import '../utils/constants/sizes.dart';
import 'vouchersubtitle.dart';

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
