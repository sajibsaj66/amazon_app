import 'package:amazon/utils/color_them.dart';
import 'package:amazon/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProductsShowList extends StatefulWidget {
  final String title;
  final List<Widget> list;
  const ProductsShowList({Key? key, required this.title, required this.list})
      : super(key: key);

  @override
  State<ProductsShowList> createState() => _ProductsShowListState();
}

class _ProductsShowListState extends State<ProductsShowList> {
  @override
  Widget build(BuildContext context) {
    // Size screenSize = Utils().getScreenSize();
    Size screenSize = MediaQuery.of(context).size;
    double titleheight = 25;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      margin:
          EdgeInsets.symmetric(horizontal: screenSize.width / 25, vertical: 10),
      padding: EdgeInsets.all(8),
      height: screenSize.height / 4,
      width: screenSize.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: titleheight,
            child: Row(
              children: [
                Text(
                  widget.title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    'Show more',
                    style: TextStyle(color: activeCyanColor),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              // height: screenSize.height - titleheight,
              height: 100,
              width: screenSize.width,

              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: widget.list,
              ),
            ),
          )
        ],
      ),
    );
  }
}
