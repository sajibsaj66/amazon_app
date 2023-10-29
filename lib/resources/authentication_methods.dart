import 'dart:developer';

import 'package:amazon/models/user_details_models.dart';
import 'package:amazon/resources/firebasefirestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationMethods {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestoreClass firebasefirestorclass = FirebaseFirestoreClass();
  Future<String> Signup(
      String name, String address, String email, String password) async {
    name.trim();
    address.trim();
    email.trim();
    password.trim();

    String output = 'Something went wrong';
    if (name != '' && address != '' && email != '' && password != '') {
      try {
        await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        UserDetailsModels user =
            UserDetailsModels(name: name, address: address);
        firebasefirestorclass.uploadNameandAdrress(user);
        output = 'success';
      } on FirebaseAuthException catch (e) {
        output = e.message.toString();
      }
    } else {
      output = 'Please fill up everything';
    }
    return output;
  }

  Future<String> Signin(String email, String password) async {
    email.trim();
    password.trim();

    String output = 'Something went wrong';
    if (email != '' && password != '') {
      try {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);

        output = 'success';
      } on FirebaseAuthException catch (e) {
        output = e.message.toString();
      }
    } else {
      output = 'Please fill up everything';
    }
    return output;
  }
}
