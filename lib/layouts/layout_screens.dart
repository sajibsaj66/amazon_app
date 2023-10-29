// import 'dart:html';

import 'package:amazon/provider/user_details_provider.dart';
import 'package:amazon/resources/firebasefirestore.dart';
import 'package:amazon/utils/color_them.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../utils/constants.dart';

class LayoutScreens extends StatefulWidget {
  const LayoutScreens({Key? key}) : super(key: key);

  @override
  State<LayoutScreens> createState() => _LayoutScreensState();
}

class _LayoutScreensState extends State<LayoutScreens> {
  PageController controller = PageController();
  int currentPage = 0;

  changePage(int page) {
    controller.jumpToPage(page);
    setState(() {
      currentPage = page;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<UserDetailsProvider>(context).getUserDetails();
    return DefaultTabController(
        length: 4,
        child: SafeArea(
          child: Scaffold(
              body: PageView(controller: controller, children: pages),
              bottomNavigationBar: Container(
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(color: Colors.grey[400]!, width: 1))),
                child: TabBar(
                    indicator: BoxDecoration(
                        border: Border(
                            top: BorderSide(color: activeCyanColor, width: 4))),
                    indicatorSize: TabBarIndicatorSize.label,
                    onTap: changePage,
                    tabs: [
                      Tab(
                        icon: Icon(
                          Icons.home,
                          color:
                              currentPage == 0 ? activeCyanColor : Colors.black,
                        ),
                      ),
                      Tab(
                        icon: Icon(Icons.account_circle_outlined,
                            color: currentPage == 1
                                ? activeCyanColor
                                : Colors.black),
                      ),
                      Tab(
                        icon: Icon(Icons.shopping_cart_outlined,
                            color: currentPage == 2
                                ? activeCyanColor
                                : Colors.black),
                      ),
                      Tab(
                        icon: Icon(Icons.menu,
                            color: currentPage == 3
                                ? activeCyanColor
                                : Colors.black),
                      ),
                    ]),
              )),
        ));
  }
}
