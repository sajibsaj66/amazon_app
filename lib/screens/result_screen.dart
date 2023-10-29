import 'package:amazon/widgets/result_widget.dart';
import 'package:amazon/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/product_model.dart';

class ResultScreen extends StatelessWidget {
  final String query;
  const ResultScreen({Key? key, required this.query}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBar(isOnlyRead: true, hasBackButton: false),
      body: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: 'Showing result for',
                    style: TextStyle(
                      fontSize: 17,
                    )),
                TextSpan(
                  text: query,
                  style: TextStyle(fontSize: 17, fontStyle: FontStyle.italic),
                ),
              ])),
            ),
          ),
          Expanded(
            child: GridView.builder(
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 2 / 3, crossAxisCount: 3),
                itemBuilder: (context, index) => ResultWidget(
                      product: ProductModel(
                          url:
                              'https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png',
                          productName:
                              'SkritsSkritsSkritsSkritsSkritsSkritsSkritsSkritsSkrits',
                          cost: 44,
                          discount: 0,
                          uId: '',
                          selerName: 'Omar',
                          selerUId: '',
                          rating: 1,
                          numOfRating: 1),
                    )),
          )
        ],
      ),
    );
  }
}
