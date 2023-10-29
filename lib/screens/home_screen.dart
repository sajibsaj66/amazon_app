import 'dart:developer';

import 'package:amazon/models/user_details_models.dart';
import 'package:amazon/utils/constants.dart';
import 'package:amazon/widgets/banner_widget.dart';
import 'package:amazon/widgets/list_catogiers.dart';
import 'package:amazon/widgets/products_show_list.dart';
import 'package:amazon/widgets/search_widget.dart';
import 'package:amazon/widgets/simple_list.dart';
import 'package:amazon/widgets/user_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double offset = 0;

  ScrollController controller = ScrollController();
  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        offset = controller.position.pixels;
      });
    });
  }

  @override
  void disspose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBar(
        isOnlyRead: true,
        hasBackButton: false,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: controller,
            child: Column(
              children: [
                SizedBox(
                  height: kAppBarHeight / 2,
                ),
                ListCatogiers(),
                BannerWidget(),
                ProductsShowList(title: 'Up to 78%', list: smallist),
                ProductsShowList(title: 'Up to 60%', list: smallist),
                ProductsShowList(title: 'Up to 50%', list: smallist),
                ProductsShowList(title: 'Expanded%', list: smallist),
              ],
            ),
          ),
          UserDetails(
            offset: offset,
          ),
        ],
      ),
    );
  }
}
