import 'package:amazon/models/review_model.dart';
import 'package:amazon/utils/constants.dart';
import 'package:amazon/utils/utils.dart';
import 'package:amazon/widgets/ratiing_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class RateModelWidget extends StatelessWidget {
  ReviewModel reviewModel;
  RateModelWidget({Key? key, required this.reviewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            reviewModel.senderName,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              SizedBox(
                  width: screenSize.width / 6,
                  child:
                      FittedBox(child: RatingWidget(rate: reviewModel.rate))),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text(rating[reviewModel.rate]),
              ),
            ],
          ),
          Text(
            reviewModel.description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
