import 'package:flutter/material.dart';
import '../../../../../../utils/constants/colors.dart';

class HomeTabBarContainer extends StatelessWidget {
  /// Custom widget for tab bar in Home Screen.
  /// It takes tab bar name, current index and its own index.
  const HomeTabBarContainer({
    super.key,
    required this.tabsText,
    required this.currentIndex,
    required this.optionIndex,
  });

  final String tabsText;
  final int currentIndex, optionIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        color: currentIndex == optionIndex ? SQColors.primary : Colors.white,
        border: Border.all(color: currentIndex == optionIndex ? Colors.transparent : SQColors.borderSecondary),
        borderRadius: BorderRadius.circular(
          100,
        ),
      ),
      child: Center(
        child: Tab(
          child: Text(
            tabsText,
            style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: currentIndex == optionIndex ? Colors.white : Colors.black,
                ),
          ),
        ),
      ),
    );
  }
}
