import 'package:amazon/models/product_model.dart';
import 'package:amazon/utils/color_them.dart';
import 'package:amazon/utils/utils.dart';
import 'package:amazon/widgets/custom_simple_widget.dart';
import 'package:amazon/widgets/customer_square_widget.dart';
import 'package:amazon/widgets/product_information_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CartItemWidget extends StatelessWidget {
  ProductModel product;

  CartItemWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Container(
      padding: const EdgeInsets.only(left: 25, top: 10, bottom: 10),
      height: screenSize.height / 2,
      width: screenSize.width,
      decoration: BoxDecoration(
          color: backgroundColor,
          border: Border(bottom: BorderSide(color: Colors.grey, width: 1))),
      child: Column(
        children: [
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: screenSize.width / 3,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Image.network(
                        'https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png'),
                  ),
                ),
                Flexible(
                  child: ProductInformationWidget(
                      nameProdcut: product.productName,
                      cost: product.cost,
                      sellerName: product.selerName),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                CustomerSquareWidget(
                    child: Icon(Icons.remove),
                    color: backgroundColor,
                    dimension: 50,
                    onPressed: () {}),
                CustomerSquareWidget(
                    child: Text(
                      '0',
                      style: TextStyle(),
                    ),
                    color: Colors.white,
                    dimension: 50,
                    onPressed: () {}),
                CustomerSquareWidget(
                    child: Icon(Icons.add),
                    color: backgroundColor,
                    dimension: 50,
                    onPressed: () {}),
              ],
            ),
            flex: 1,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      CustomSimpleWidget(text: 'Delete', onPressed: () {}),
                      SizedBox(
                        width: 7,
                      ),
                      CustomSimpleWidget(
                          text: 'Save for later', onPressed: () {}),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'see more details',
                        style: TextStyle(color: activeCyanColor),
                      ),
                    ),
                  )
                ],
              ),
            ),
            flex: 1,
          ),
        ],
      ),
    );
  }
}
