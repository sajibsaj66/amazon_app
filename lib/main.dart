// import 'dart:html';

import 'package:amazon/layouts/layout_screens.dart';
import 'package:amazon/provider/user_details_provider.dart';
import 'package:amazon/screens/product_screen.dart';
import 'package:amazon/screens/result_screen.dart';
import 'package:amazon/screens/sell_screen.dart';
import 'package:amazon/screens/sign_in_screen.dart';
import 'package:amazon/utils/color_them.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/product_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBSvPEcxSZILSspEAczhascMABkibvJIts",
            authDomain: "clone-dd0c7.firebaseapp.com",
            projectId: "clone-dd0c7",
            storageBucket: "clone-dd0c7.appspot.com",
            messagingSenderId: "952116743074",
            appId: "1:952116743074:web:fb99bb4156ab8c461cc0fb"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(AmazonClone());
}

class AmazonClone extends StatelessWidget {
  const AmazonClone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserDetailsProvider())],
      child: MaterialApp(
          title: 'Amazon_Clone',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light()
              .copyWith(scaffoldBackgroundColor: backgroundColor),
          home: Scaffold(
            body: StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, user) {
                  if (user.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (user.hasData) {
                    return const LayoutScreens();
                    // return SellScreen();
                  } else {
                    return SignInScreen();
                  }
                }),
          )),
    );
  }
}
//this is main file
