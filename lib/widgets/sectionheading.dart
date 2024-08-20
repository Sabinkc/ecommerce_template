import 'package:flutter/material.dart';
import '../utils/constants/colors.dart';

class SectionHeading extends StatelessWidget {
  const SectionHeading({
    super.key,
    required this.headingTitle,
    required this.func,
    this.showButton = true,
    this.buttonTitle = "See all",
  });
  final String headingTitle;
  final void Function()? func;
  final bool? showButton;
  final String? buttonTitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          headingTitle,
          style: Theme.of(context).textTheme.titleLarge!.apply(
                fontSizeDelta: 1,
                color: Colors.black,
              ),
        ),
        showButton!
            ? InkWell(
                overlayColor: WidgetStateColor.transparent,
                onTap: func,
                child: Text(
                  buttonTitle!,
                  style: Theme.of(context).textTheme.bodySmall!.apply(
                        color: SQColors.black,
                      ),
                ),
              )
            : Container(),
      ],
    );
  }
}
