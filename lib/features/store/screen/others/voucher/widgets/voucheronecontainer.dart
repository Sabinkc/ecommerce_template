import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:ticket_clippers/ticket_clippers.dart';
import '../../../../../../utils/constants/colors.dart';

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
