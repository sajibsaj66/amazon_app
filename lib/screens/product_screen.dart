import 'package:amazon/models/product_model.dart';
import 'package:amazon/models/review_model.dart';
import 'package:amazon/models/user_details_models.dart';
import 'package:amazon/utils/color_them.dart';
import 'package:amazon/utils/constants.dart';
import 'package:amazon/utils/utils.dart';
import 'package:amazon/widgets/cost_widget.dart';
import 'package:amazon/widgets/custom_simple_widget.dart';
import 'package:amazon/widgets/customer_square_widget.dart';
import 'package:amazon/widgets/custum_main_button.dart';
import 'package:amazon/widgets/rate_model_widget.dart';
import 'package:amazon/widgets/ratiing_widget.dart';
import 'package:amazon/widgets/review_rating.dart';
import 'package:amazon/widgets/search_widget.dart';
import 'package:amazon/widgets/user_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProductScreen extends StatefulWidget {
  ProductModel productmodel;
  ProductScreen({Key? key, required this.productmodel}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  SizedBox heightBetweenWidget = SizedBox(
    height: 20,
  );
  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Scaffold(
        appBar: SearchBar(isOnlyRead: true, hasBackButton: true),
        body: Stack(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: kAppBarHeight / 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Text(
                                  widget.productmodel.selerName,
                                  style: TextStyle(
                                      fontSize: 16, color: activeCyanColor),
                                ),
                              ),
                              Text(widget.productmodel.productName),
                            ],
                          ),
                          RatingWidget(rate: widget.productmodel.rating),
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      height: screenSize.height / 2,
                      child: FittedBox(
                          child: Image.network(widget.productmodel.url)),
                    ),
                  ),
                  heightBetweenWidget,
                  CostWidget(
                      color: Colors.black, cost: widget.productmodel.cost),
                  heightBetweenWidget,
                  CustumMainButton(
                      child: const Text(
                        'Buy Now',
                        style: TextStyle(color: Colors.black),
                      ),
                      color: Colors.orange,
                      onPressed: () {},
                      isloading: false),
                  heightBetweenWidget,
                  CustumMainButton(
                      child: const Text(
                        'Add to cart',
                        style: TextStyle(color: Colors.black),
                      ),
                      color: Colors.yellow,
                      onPressed: () {},
                      isloading: false),
                  heightBetweenWidget,
                  CustomSimpleWidget(
                      text: 'add a review for this product',
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => const ReviewRating());
                      }),
                  heightBetweenWidget,
                  Container(
                    height: 100,
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) => RateModelWidget(
                          reviewModel: ReviewModel(
                              senderName: 'Omar',
                              description: 'this is a poor product',
                              rate: 2)),
                    ),
                  )
                ],
              ),
            ),
          ),
          UserDetails(
            offset: 0,
          ),
        ]));
  }
}
