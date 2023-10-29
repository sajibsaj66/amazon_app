import 'package:amazon/screens/result_screen.dart';
import 'package:amazon/utils/constants.dart';
import 'package:amazon/widgets/list_catogiers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CategoriesMoreWidget extends StatelessWidget {
  final int index;
  const CategoriesMoreWidget({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(query: categoriesList[index]),
          )),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 8,
                  spreadRadius: 1)
            ]),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(categoryLogos[index]),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  categoriesList[index],
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
