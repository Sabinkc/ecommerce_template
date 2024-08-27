import 'package:flutter/material.dart';
import '../../../../../utils/constants/colors.dart';

class SearchedProductContainer extends StatelessWidget {
  const SearchedProductContainer({
    super.key,
    required this.word,
  });
  final String word;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
      decoration: BoxDecoration(
        color: SQColors.softGrey,
        borderRadius: BorderRadius.circular(2),
      ),
      child: Text(
        word,
        style: Theme.of(context).textTheme.labelMedium!.apply(
              color: Colors.black,
              fontWeightDelta: 1,
            ),
      ),
    );
  }
}
