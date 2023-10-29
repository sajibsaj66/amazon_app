// import 'dart:html';

import 'package:amazon/screens/sign_up_screen.dart';
import 'package:amazon/utils/color_them.dart';
import 'package:amazon/utils/utils.dart';
import 'package:amazon/widgets/custum_main_button.dart';
import 'package:amazon/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../resources/authentication_methods.dart';
import '../utils/constants.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  Size screenSize = Utils().getScreenSize();
  TextEditingController EmailController = TextEditingController();
  TextEditingController PassController = TextEditingController();
  AuthenticationMethods authenticationmethods = AuthenticationMethods();
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    @override
    void dispose() {
      EmailController.dispose();
      PassController.dispose();
      super.dispose();
    }

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
                    Container(
                        height: screenSize.height * 0.6,
                        width: screenSize.width * 0.4,
                        padding: EdgeInsets.all(25),
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.grey)),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Sign-In',
                                style: TextStyle(
                                    fontSize: 28, fontWeight: FontWeight.w600),
                              ),
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
                                    'SignIn',
                                    style: TextStyle(letterSpacing: 0.12),
                                  ),
                                  color: yellowColor,
                                  isloading: isloading,
                                  onPressed: () async {
                                    setState(() {
                                      isloading = true;
                                    });
                                    Future.delayed(Duration(seconds: 2));
                                    String output =
                                        await authenticationmethods.Signin(
                                            EmailController.text,
                                            PassController.text);
                                    setState(() {
                                      isloading = false;
                                    });
                                    if (output == 'success') {
                                    } else {
                                      Utils().showSnackBar(
                                          context: context, content: output);
                                    }
                                  },
                                ),
                              )
                            ])),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 1,
                            color: Colors.grey,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'New to Amazon?',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 1,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    CustumMainButton(
                      child: Text(
                        "create your own account",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      color: Colors.grey,
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpScreen()),
                        );
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
