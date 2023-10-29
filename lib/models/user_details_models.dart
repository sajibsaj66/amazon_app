import 'package:firebase_auth/firebase_auth.dart';

class UserDetailsModels {
  String name;
  String address;

  UserDetailsModels({required this.name, required this.address});

  Map<String, dynamic> getjson() => {'name': name, 'address': address};

  factory UserDetailsModels.getModelFromJson(Map<String, dynamic> json) {
    return UserDetailsModels(name: json['name'], address: json['address']);
  }
}
