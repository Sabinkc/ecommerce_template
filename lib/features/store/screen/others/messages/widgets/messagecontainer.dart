import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:icons_plus/icons_plus.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';

class MessagesContainer extends StatelessWidget {
  const MessagesContainer({
    super.key,
    required this.title,
    required this.date,
    required this.imagelink,
    required this.subtitle,
    required this.messagetype,
  });

  final String title, date, imagelink, subtitle, messagetype;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10,
      ),
      child: Slidable(
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
          width: size.width,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          decoration: BoxDecoration(
            color: SQColors.softGrey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: messagetype == "ORDER"
                        ? Colors.blue
                        : messagetype == "PROMO"
                            ? Colors.redAccent
                            : Colors.amber,
                    radius: 16,
                    child: messagetype == "ORDER"
                        ? const Icon(
                            Iconsax.box_bold,
                            size: 20,
                            color: Colors.white,
                          )
                        : messagetype == "PROMO"
                            ? const Icon(
                                Iconsax.flash_bold,
                                size: 20,
                                color: Colors.white,
                              )
                            : const Icon(
                                Iconsax.activity_bold,
                                size: 20,
                                color: Colors.white,
                              ),
                  ),
                  const SizedBox(
                    width: SQSizes.sm,
                  ),
                  Flexible(
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          Text(
                            date,
                            style: Theme.of(context).textTheme.labelSmall!.apply(
                                  color: SQColors.darkGrey,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: SQSizes.sm,
              ),
              Container(
                width: size.width,
                height: 110,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/Banner.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: SQSizes.sm,
              ),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
