import 'package:amazon/utils/color_them.dart';
import 'package:amazon/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({Key? key}) : super(key: key);

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  int current = 0;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double heightAd = screenSize.width / 5;

    return GestureDetector(
      onHorizontalDragEnd: (_) {
        if (current == (largeAds.length - 1)) {
          setState(() {
            current -= 1;
          });
        }
        setState(() {
          current += 1;
        });
      },
      child: Column(
        children: [
          Stack(
            children: [
              Image.network(
                largeAds[current],
                width: double.infinity,
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: screenSize.width,
                  height: 150,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                        backgroundColor,
                        backgroundColor.withOpacity(0)
                      ])),
                ),
              )
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            smallAd(0, heightAd),
            smallAd(1, heightAd),
            smallAd(2, heightAd),
            smallAd(3, heightAd),
          ]),
        ],
      ),
    );
  }

  Widget smallAd(int index, double height) {
    return Container(
      height: height,
      width: height,
      decoration: ShapeDecoration(
          color: Colors.white,
          shadows: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 2,
                spreadRadius: 3)
          ],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(smallAds[index]),
          const SizedBox(
            height: 5,
          ),
          Text(adItemNames[index]),
        ],
      ),
    );
  }
}
