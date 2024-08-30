import 'package:ecommerce/common/widgets/elevatedbutton.dart';
import 'package:ecommerce/common/widgets/textfieldwithtitle.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import '../../../../utils/constants/colors.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: const [
        GestureType.onTap,
        GestureType.onPanUpdateAnyDirection,
      ],
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Feedback",
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
            vertical: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Your feedback is valuable to us, feel free to share.",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: SQSizes.sm,
              ),
              const Divider(),
              const SizedBox(
                height: SQSizes.sm,
              ),
              TextFieldWithTitle(
                title: "Email",
                hinttext: "xyz@gmail.com",
                controller: TextEditingController(),
              ),
              Text(
                "Rating",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: SQSizes.sm,
              ),
              RatingBar.builder(
                itemPadding: const EdgeInsets.only(right: 5),
                itemSize: 55,
                initialRating: 0,
                itemCount: 5,
                itemBuilder: (context, index) {
                  switch (index) {
                    case 0:
                      return const Icon(
                        Icons.sentiment_very_dissatisfied,
                        color: Colors.red,
                      );
                    case 1:
                      return const Icon(
                        Icons.sentiment_dissatisfied,
                        color: Colors.redAccent,
                      );
                    case 2:
                      return const Icon(
                        Icons.sentiment_neutral,
                        color: Colors.amber,
                      );
                    case 3:
                      return const Icon(
                        Icons.sentiment_satisfied,
                        color: Colors.lightGreen,
                      );
                    case 4:
                      return const Icon(
                        Icons.sentiment_very_satisfied,
                        color: Colors.green,
                      );
                    default:
                      return const Icon(Icons.abc);
                  }
                },
                onRatingUpdate: (rating) {},
              ),
              const SizedBox(
                height: SQSizes.sm,
              ),
              TextFieldWithTitle(
                title: "Feedback",
                hinttext: "",
                controller: TextEditingController(),
                maxline: 5,
              ),
              const SizedBox(
                height: SQSizes.sm,
              ),
              SQElevatedButton(
                func: () {},
                title: "Submit",
              )
            ],
          ),
        ),
      ),
    );
  }
}
