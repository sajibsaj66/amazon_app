import 'package:amazon/screens/result_screen.dart';
import 'package:amazon/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ListCatogiers extends StatelessWidget {
  const ListCatogiers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          Container(
            height: kAppBarHeight,
            // width: double.infinity,
            width: screenSize.width,
            color: Colors.white,
            // width: screenSize.width / categoriesList.length,

            child: ListView.builder(
                shrinkWrap: true,
                itemCount: categoriesList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ResultScreen(query: categoriesList[index]),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: Center(
                        child: Column(
                          // mainAxisSize: MainAxisSize.max,
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                                backgroundImage:
                                    NetworkImage(categoryLogos[index])),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(categoriesList[index]),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
