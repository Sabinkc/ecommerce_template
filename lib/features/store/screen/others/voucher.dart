import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:ticket_clippers/ticket_clippers.dart';
import '../../../../utils/constants/colors.dart';

class VoucherScreen extends StatelessWidget {
  const VoucherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
            ClipPath(
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
                                  text: "15",
                                  style: Theme.of(context).textTheme.headlineLarge!.apply(
                                        color: SQColors.primary,
                                      ),
                                ),
                                TextSpan(
                                  text: " % off",
                                  style: Theme.of(context).textTheme.titleMedium!.apply(
                                        color: SQColors.primary,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "No min Spend",
                            style: Theme.of(context).textTheme.bodyMedium!.apply(
                                  color: SQColors.primary,
                                ),
                          ),
                        ],
                      ),
                    ),
                    DottedLine(
                      direction: Axis.vertical,
                      dashColor: SQColors.primary.withOpacity(0.3),
                      dashLength: 5,
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Free Shipping",
                              style: Theme.of(context).textTheme.titleMedium!.apply(
                                    color: SQColors.primary,
                                  ),
                            ),
                            Text(
                              "Selected Products",
                              style: Theme.of(context).textTheme.labelLarge!.apply(
                                    color: SQColors.primary,
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
                              "Valid till: 31 Aug, 11:59 PM",
                              style: Theme.of(context).textTheme.labelMedium!.apply(
                                    color: SQColors.primary,
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
          ],
        ),
      ),
    );
  }
}
