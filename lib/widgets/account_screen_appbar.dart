import 'package:amazon/utils/constants.dart';
import 'package:amazon/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../utils/color_them.dart';

class AccountScreenAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Size preferredSize;
  AccountScreenAppBar({Key? key})
      : preferredSize = Size.fromHeight(kAppBarHeight),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Container(
      height: kAppBarHeight,
      width: screenSize.width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: backgroundGradient,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network(
              amazonLogoUrl,
              height: kAppBarHeight * 0.7,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () => null,
                  icon: Icon(
                    Icons.notifications_outlined,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () => null,
                  icon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
