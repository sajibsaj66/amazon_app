import 'package:amazon/utils/color_them.dart';
import 'package:amazon/utils/utils.dart';
import 'package:amazon/widgets/cost_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProductInformationWidget extends StatelessWidget {
  final String nameProdcut;
  final double cost;
  final String sellerName;

  const ProductInformationWidget(
      {Key? key,
      required this.nameProdcut,
      required this.cost,
      required this.sellerName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return SizedBox(
      width: screenSize.width / 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              nameProdcut,
              maxLines: 2,
              style: TextStyle(
                  letterSpacing: 0.4,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  overflow: TextOverflow.ellipsis),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 7),
            child: CostWidget(color: Colors.black, cost: 750),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: 'Sold by:',
                  style: TextStyle(color: Colors.grey[700], fontSize: 12)),
              TextSpan(
                  text: sellerName,
                  style: TextStyle(color: activeCyanColor, fontSize: 12)),
            ])),
          )
        ],
      ),
    );
  }
}
