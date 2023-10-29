import 'dart:typed_data';

import 'package:amazon/provider/user_details_provider.dart';
import 'package:amazon/resources/firebasefirestore.dart';
import 'package:amazon/utils/utils.dart';
import 'package:amazon/widgets/custum_main_button.dart';
import 'package:amazon/widgets/loading_widget.dart';
import 'package:amazon/widgets/text_field_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class SellScreen extends StatefulWidget {
  const SellScreen({Key? key}) : super(key: key);

  @override
  State<SellScreen> createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {
  bool isloading = false;
  int selected = 1;
  List<int> keysfordiscount = [0, 70, 60, 50];
  Size screenSize = Utils().getScreenSize();
  Uint8List? image;
  TextEditingController nameController = TextEditingController();
  TextEditingController costController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    costController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: !isloading
              ? SingleChildScrollView(
                  child: SizedBox(
                    height: screenSize.height,
                    width: screenSize.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Stack(
                              children: [
                                image == null
                                    ? Image.network(
                                        'https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png',
                                        height: screenSize.height / 10,
                                      )
                                    : Image.memory(
                                        image!,
                                        height: screenSize.height / 10,
                                      ),
                                IconButton(
                                    onPressed: () async {
                                      Uint8List? temp =
                                          await Utils().pickimage();
                                      if (temp != null) {
                                        setState(() {
                                          image = temp;
                                        });
                                      }
                                    },
                                    icon: Icon(Icons.file_upload))
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              width: screenSize.width * 0.7,
                              height: screenSize.height * 0.7,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey, width: 1)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextFieldWidget(
                                      title: ' Name',
                                      controller: nameController,
                                      abscuretext: false),
                                  TextFieldWidget(
                                    title: ' Cost',
                                    controller: costController,
                                    abscuretext: false,
                                  ),
                                  Text(
                                    'Discount',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  ListTile(
                                    title: Text('None'),
                                    leading: Radio(
                                        value: 1,
                                        groupValue: selected,
                                        onChanged: (int? i) {
                                          setState(() {
                                            selected = i!;
                                          });
                                        }),
                                  ),
                                  ListTile(
                                    title: Text('70%'),
                                    leading: Radio(
                                        value: 2,
                                        groupValue: selected,
                                        onChanged: (int? i) {
                                          setState(() {
                                            selected = i!;
                                          });
                                        }),
                                  ),
                                  ListTile(
                                    title: Text('60%'),
                                    leading: Radio(
                                        value: 3,
                                        groupValue: selected,
                                        onChanged: (int? i) {
                                          setState(() {
                                            selected = i!;
                                          });
                                        }),
                                  ),
                                  ListTile(
                                    title: Text('50%'),
                                    leading: Radio(
                                        value: 4,
                                        groupValue: selected,
                                        onChanged: (int? i) {
                                          setState(() {
                                            selected = i!;
                                          });
                                        }),
                                  ),
                                ],
                              ),
                            ),
                            CustumMainButton(
                                child: Text(
                                  'Sell',
                                  style: TextStyle(color: Colors.black),
                                ),
                                color: Colors.yellow,
                                onPressed: () async {
                                  String output = await FirebaseFirestoreClass()
                                      .UploadProductToDataBase(
                                          image: image!,
                                          productName: nameController.text,
                                          Rowcost: costController.text,
                                          discount:
                                              keysfordiscount[selected - 1],
                                          selerName:
                                              Provider.of<UserDetailsProvider>(
                                                      context,
                                                      listen: false)
                                                  .userDetails
                                                  .name,
                                          selerUId: FirebaseAuth
                                              .instance.currentUser!.uid);

                                  if (output == 'success') {
                                    Utils().showSnackBar(
                                        context: context,
                                        content: 'Posted Product');
                                  } else {
                                    Utils().showSnackBar(
                                        context: context, content: output);
                                  }
                                },
                                isloading: isloading),
                            CustumMainButton(
                                child: Text(
                                  'Back',
                                  style: TextStyle(color: Colors.black),
                                ),
                                color: Colors.grey[300]!,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                isloading: false),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : LoadingWidget()),
    );
  }
}
