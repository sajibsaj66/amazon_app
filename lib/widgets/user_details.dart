import 'package:amazon/models/product_model.dart';
import 'package:amazon/models/user_details_models.dart';
import 'package:amazon/provider/user_details_provider.dart';
import 'package:amazon/utils/color_them.dart';
import 'package:amazon/utils/constants.dart';
import 'package:amazon/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class UserDetails extends StatelessWidget {
  final double offset;

  const UserDetails({
    Key? key,
    required this.offset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    UserDetailsModels userDetails =
        Provider.of<UserDetailsProvider>(context).userDetails;
    return Positioned(
      top: -offset / 5,
      child: Container(
        height: kAppBarHeight / 2,
        width: screenSize.width,
        // width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: lightBackgroundaGradient,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 3, bottom: 3, left: 10),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.location_on_outlined,
                  color: Colors.grey[900],
                ),
              ),
              SizedBox(
                width: screenSize.width * 0.7,
                child: Text(
                  'Deliver to ${userDetails.name} - ${userDetails.address} ',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey[900]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
