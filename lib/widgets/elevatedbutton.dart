import 'package:flutter/material.dart';
import '../utils/constants/colors.dart';

class SQElevatedButton extends StatelessWidget {
  const SQElevatedButton({
    super.key,
    required this.func,
    required this.title,
  });

  final VoidCallback func;
  final String title;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: size.height * 0.055,
      child: ElevatedButton(
        onPressed: func,
        style: ElevatedButton.styleFrom(
          backgroundColor: SQColors.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        child: Text(
          title,
          maxLines: 1,
          style: Theme.of(context).textTheme.headlineSmall!.apply(
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}
