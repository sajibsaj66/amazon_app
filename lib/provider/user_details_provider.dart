import 'package:amazon/models/user_details_models.dart';
import 'package:amazon/resources/firebasefirestore.dart';
import 'package:flutter/cupertino.dart';

class UserDetailsProvider with ChangeNotifier {
  UserDetailsModels userDetails;
  UserDetailsProvider()
      : userDetails = UserDetailsModels(name: 'loading', address: 'loading');

  Future getUserDetails() async {
    userDetails = await FirebaseFirestoreClass().getNameandAdress();
    notifyListeners();
  }
}
