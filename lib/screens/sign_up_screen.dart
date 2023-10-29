import 'dart:developer';

import 'package:amazon/resources/authentication_methods.dart';
import 'package:amazon/screens/sign_in_screen.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
// import 'dart:html';

import 'package:amazon/utils/color_them.dart';
import 'package:amazon/utils/utils.dart';
import 'package:amazon/widgets/custum_main_button.dart';
import 'package:amazon/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../utils/constants.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  Size screenSize = Utils().getScreenSize();
  TextEditingController NameController = TextEditingController();
  TextEditingController AddressController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  TextEditingController PassController = TextEditingController();
  AuthenticationMethods authenticationmethods = AuthenticationMethods();
  bool isloading = false;

  @override
  void dispose() {
    NameController.dispose();
    AddressController.dispose();
    EmailController.dispose();
    PassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SizedBox(
            height: screenSize.height,
            width: screenSize.width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      amazonLogo,
                      height: screenSize.height * 0.10,
                    ),
                    SizedBox(
                      height: screenSize.height * 0.6,
                      child: FittedBox(
                        child: Container(
                            height: screenSize.height * 0.8,
                            width: screenSize.width * 0.4,
                            padding: EdgeInsets.all(25),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.grey)),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Sign-Up',
                                    style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  TextFieldWidget(
                                      title: 'Name',
                                      controller: NameController,
                                      abscuretext: false),
                                  TextFieldWidget(
                                      title: 'Address',
                                      controller: AddressController,
                                      abscuretext: false),
                                  TextFieldWidget(
                                      title: 'Email',
                                      controller: EmailController,
                                      abscuretext: false),
                                  TextFieldWidget(
                                      title: 'Password',
                                      controller: PassController,
                                      abscuretext: true),
                                  Align(
                                    alignment: Alignment.center,
                                    child: CustumMainButton(
                                      child: Text(
                                        'SignUp',
                                        style: TextStyle(letterSpacing: 0.12),
                                      ),
                                      color: yellowColor,
                                      isloading: isloading,
                                      onPressed: () async {
                                        setState(() {
                                          isloading = true;
                                        });
                                        String output =
                                            await authenticationmethods.Signup(
                                                NameController.text,
                                                AddressController.text,
                                                EmailController.text,
                                                PassController.text);

                                        if (output == 'success') {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    SignInScreen(),
                                              ));
                                          setState(() {
                                            isloading = false;
                                          });
                                          log(output);
                                        } else {
                                          Utils().showSnackBar(
                                              context: context,
                                              content: output);
                                        }
                                      },
                                    ),
                                  )
                                ])),
                      ),
                    ),
                    CustumMainButton(
                      child: Text(
                        "Back",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      color: Colors.grey,
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignInScreen(),
                            ));
                        // Navigator.pop(context);
                      },
                      isloading: false,
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
