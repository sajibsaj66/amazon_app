import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomSimpleWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomSimpleWidget(
      {Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(text),
      ),
    );
  }
}
