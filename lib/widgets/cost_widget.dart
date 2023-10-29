import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CostWidget extends StatelessWidget {
  final Color color;
  final double cost;
  const CostWidget({Key? key, required this.color, required this.cost})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            cost.toInt().toString(),
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: color),
          ),
          Text(
            '\$',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: color),
          ),
        ],
      ),
    );
  }
}
