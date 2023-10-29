import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rating_dialog/rating_dialog.dart';

class ReviewRating extends StatelessWidget {
  const ReviewRating({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingDialog(
      initialRating: 1.0,
      // your app's name?
      title: const Text(
        'Type a review for this product',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),

      submitButtonText: 'Send',
      commentHint: 'Type Here',
      onCancelled: () => print('cancelled'),
      onSubmitted: (RatingDialogResponse res) {
        print(res.comment);
        print(res.rating);
      },
    );

    // show the dialog
  }
}
