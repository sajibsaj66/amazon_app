import 'package:amazon/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustumMainButton extends StatelessWidget {
  final Widget child;
  final Color color;
  final VoidCallback onPressed;
  final bool isloading;
  const CustumMainButton(
      {Key? key,
      required this.child,
      required this.color,
      required this.onPressed,
      required this.isloading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: color, fixedSize: Size(screenSize.width * 0.25, 40)),
      onPressed: onPressed,
      child: !isloading
          ? child
          : Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            ),
    );
  }
}
