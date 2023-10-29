import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomerSquareWidget extends StatelessWidget {
  final Color color;
  final double dimension;
  final Widget child;
  final VoidCallback onPressed;

  const CustomerSquareWidget(
      {Key? key,
      required this.child,
      required this.color,
      required this.dimension,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: dimension,
        width: dimension,
        decoration: ShapeDecoration(
            color: color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2),
                side: BorderSide(color: Colors.grey[400]!, width: 1))),
        child: Center(child: child),
      ),
    );
  }
}
