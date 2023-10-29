import 'package:amazon/models/product_model.dart';
import 'package:amazon/models/user_details_models.dart';
import 'package:amazon/utils/color_them.dart';
import 'package:amazon/widgets/cart_widget.dart';
import 'package:amazon/widgets/custum_main_button.dart';
import 'package:amazon/widgets/search_widget.dart';
import 'package:amazon/widgets/user_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBar(isOnlyRead: true, hasBackButton: false),
      body: Center(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: UserDetails(
                offset: 0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustumMainButton(
                  child: Text(
                    'Proceed to (n) item',
                    style: TextStyle(color: Colors.black),
                  ),
                  color: yellowColor,
                  onPressed: () {},
                  isloading: false),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) => CartItemWidget(
                  product: ProductModel(
                      url:
                          'https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png',
                      productName: 'Skrits',
                      cost: 44,
                      discount: 0,
                      uId: '',
                      selerName: 'Omar',
                      selerUId: '',
                      rating: 1,
                      numOfRating: 1),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
