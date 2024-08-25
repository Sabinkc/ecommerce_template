import 'package:flutter/material.dart';

class ReceiptContent extends StatelessWidget {
  // Custom Widget to show receipt content, it takes title and price
  const ReceiptContent({
    super.key,
    required this.title,
    required this.price,
  });

  final String title, price;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "$title :",
            style: Theme.of(context).textTheme.titleMedium!.apply(
                  color: title == "Discount" ? Colors.red : Colors.black,
                ),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Rs: ",
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: title == "Discount" ? Colors.red : Colors.black,
                      ),
                ),
                TextSpan(
                  text: price,
                  style: Theme.of(context).textTheme.titleLarge!.apply(
                        color: title == "Discount" ? Colors.red : Colors.black,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
