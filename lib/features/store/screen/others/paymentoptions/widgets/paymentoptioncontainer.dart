import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:getwidget/getwidget.dart';
import 'package:icons_plus/icons_plus.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';

class PaymentOptionContainer extends StatelessWidget {
  const PaymentOptionContainer({
    super.key,
    required this.title,
    required this.subtitle,
    required this.selected,
    required this.cardtype,
  });

  final String title, subtitle, cardtype;
  final bool selected;

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
                height: 200,
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
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 20,
        ),
        width: size.width,
        decoration: BoxDecoration(
          color: SQColors.softGrey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(
              title.contains("Card") ? Iconsax.card_outline : Iconsax.moneys_outline,
              size: 30,
              color: SQColors.dark,
            ),
            const SizedBox(
              width: SQSizes.md,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(
                        width: SQSizes.sml,
                      ),
                      cardtype.isNotEmpty
                          ? Text(
                              cardtype,
                              style: Theme.of(context).textTheme.labelLarge!.apply(
                                    fontWeightDelta: 1,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.grey,
                                  ),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                  subtitle.isNotEmpty
                      ? Text(
                          subtitle,
                          style: Theme.of(context).textTheme.bodyMedium,
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
            GFCheckbox(
              size: GFSize.SMALL,
              type: GFCheckboxType.circle,
              onChanged: (value) {},
              value: selected,
            )
          ],
        ),
      ),
    );
  }
}
