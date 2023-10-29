import 'package:amazon/models/product_model.dart';
import 'package:amazon/utils/color_them.dart';
import 'package:amazon/utils/utils.dart';
import 'package:amazon/widgets/cost_widget.dart';
import 'package:amazon/widgets/ratiing_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ResultWidget extends StatelessWidget {
  ProductModel product;
  ResultWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: screenSize.width / 3, child: Image.network(product.url)),
          Padding(
            padding: const EdgeInsets.only(bottom: 2.0),
            child: Expanded(
              child: Text(
                product.productName,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              RatingWidget(rate: product.rating),
              Padding(
                padding: const EdgeInsets.only(left: 7.0),
                child: Text(
                  product.numOfRating.toString(),
                  style: TextStyle(color: activeCyanColor),
                ),
              ),
            ],
          ),
          CostWidget(color: Color.fromRGBO(255, 92, 9, 3), cost: product.cost),
        ],
      ),
    );
  }
}
