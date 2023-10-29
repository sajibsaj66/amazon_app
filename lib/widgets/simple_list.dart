import 'package:amazon/models/product_model.dart';
import 'package:amazon/screens/product_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SimpleList extends StatelessWidget {
  ProductModel productModel;
  SimpleList({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductScreen(productmodel: productModel),
          )),
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(8),
            child: Image.network(productModel.url)),
      ),
    );
  }
}
