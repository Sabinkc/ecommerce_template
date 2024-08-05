import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class AddressContainer extends StatelessWidget {
  const AddressContainer({
    super.key,
    required this.fullname,
    required this.phoneno,
    required this.municipality,
    required this.street,
    required this.landmark,
    required this.place,
    required this.defaultShipping,
  });
  final String fullname, phoneno, municipality, street, landmark, place;
  final bool defaultShipping;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: SQColors.borderSecondary,
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                fullname,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(
                width: SQSizes.sm,
              ),
              Expanded(
                child: Text(
                  phoneno,
                  style: Theme.of(context).textTheme.titleSmall!.apply(
                        color: SQColors.textSecondary,
                      ),
                ),
              ),
              Text(
                "Edit",
                style: Theme.of(context).textTheme.titleSmall!.apply(
                      fontWeightDelta: 1,
                    ),
              ),
            ],
          ),
          const SizedBox(
            height: SQSizes.xs,
          ),
          Text(
            "$municipality, $street",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: SQSizes.xs,
          ),
          Text(
            landmark,
            style: Theme.of(context).textTheme.titleSmall!.apply(
                  color: SQColors.textSecondary,
                ),
          ),
          const SizedBox(
            height: SQSizes.sm,
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: Center(
                  child: Text(
                    place,
                  ),
                ),
              ),
              const SizedBox(
                width: SQSizes.sm,
              ),
              if (defaultShipping)
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    border: Border.all(
                      color: SQColors.primary,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "Default Shipping & Billing address",
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(
            height: SQSizes.xs,
          ),
        ],
      ),
    );
  }
}
