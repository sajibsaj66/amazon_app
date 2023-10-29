import 'package:amazon/screens/result_screen.dart';
import 'package:amazon/screens/search_screen.dart';
import 'package:amazon/utils/color_them.dart';
import 'package:amazon/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../utils/constants.dart';

class SearchBar extends StatelessWidget with PreferredSizeWidget {
  bool isOnlyRead;
  bool hasBackButton;
  SearchBar({Key? key, required this.isOnlyRead, required this.hasBackButton})
      : preferredSize = const Size.fromHeight(kAppBarHeight),
        super(key: key);
  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    //  Size screenSize = Utils().getScreenSize();
    Size screenSize = MediaQuery.of(context).size;

    return Container(
      height: kAppBarHeight,
      width: screenSize.width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: backgroundGradient,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight)),
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            hasBackButton
                ? IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back))
                : Container(),
            SizedBox(
              width: screenSize.width * 0.8,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: Offset(0, 5)),
                  ],
                ),
                child: TextField(
                    onSubmitted: (String query) => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultScreen(query: query),
                        )),
                    readOnly: isOnlyRead,
                    onTap: () {
                      if (isOnlyRead) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchScreen(),
                            ));
                      }
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        suffixIcon: Icon(Icons.camera_alt_outlined),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'search for something in amazon',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: BorderSide(width: 1, color: Colors.grey),
                        ))),
              ),
            ),
            IconButton(
                onPressed: () => null, icon: Icon(Icons.mic_none_outlined))
          ],
        ),
      ),
    );
  }
}
