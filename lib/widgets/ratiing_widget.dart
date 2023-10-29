import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class RatingWidget extends StatelessWidget {
  final int rate;
  const RatingWidget({Key? key, required this.rate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    for (int i = 0; i < 5; i++) {
      children.add(i < rate
          ? Icon(
              Icons.star,
              color: Colors.orange,
            )
          : Icon(Icons.star_border, color: Colors.orange));
    }

    return Row(children: children);
  }
}
