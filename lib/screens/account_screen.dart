import 'package:amazon/provider/user_details_provider.dart';
import 'package:amazon/screens/sell_screen.dart';
import 'package:amazon/utils/constants.dart';
import 'package:amazon/utils/utils.dart';
import 'package:amazon/widgets/account_screen_appbar.dart';
import 'package:amazon/widgets/custum_main_button.dart';
import 'package:amazon/widgets/products_show_list.dart';
import 'package:amazon/widgets/user_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../models/user_details_models.dart';
import '../utils/color_them.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  Size screenSize = Utils().getScreenSize();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AccountScreenAppBar(),
        body: SingleChildScrollView(
          child: SizedBox(
            height: screenSize.height,
            width: screenSize.width,
            child: Column(
              children: [
                IntroductionAccountScreen(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustumMainButton(
                      child: Text(
                        'SignIn',
                        style: TextStyle(color: Colors.black),
                      ),
                      color: Colors.orange,
                      onPressed: () => null,
                      isloading: false),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustumMainButton(
                      child: Text(
                        'Sell',
                        style: TextStyle(color: Colors.black),
                      ),
                      color: yellowColor,
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SellScreen(),
                          )),
                      isloading: false),
                ),
                ProductsShowList(title: 'Your Orders', list: smallist)
              ],
            ),
          ),
        ));
  }
}

class IntroductionAccountScreen extends StatelessWidget {
  const IntroductionAccountScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserDetailsModels UserDetails =
        Provider.of<UserDetailsProvider>(context).userDetails;
    return Container(
      height: kAppBarHeight / 2,
      // width: screenSize.width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: backgroundGradient,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight)),

      child: Container(
        height: kAppBarHeight / 2,
        // width: screenSize.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.white,
          Colors.white.withOpacity(0.000000000001)
        ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: 'Hello, ',
                    style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 26,
                        fontWeight: FontWeight.bold)),
                TextSpan(
                    text: UserDetails.name,
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 26,
                    )),
              ])),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://m.media-amazon.com/images/I/11CR97WoieL._SX90_SY90_.png'),
              ),
            ),
            Text(
              'Order Requests',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) => ListTile(
                  title: Text(
                    'Order:Black Show',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text('Address: SomeWhere on the earth'),
                  trailing: Icon(Icons.check),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
