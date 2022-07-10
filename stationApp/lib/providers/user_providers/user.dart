import 'package:flutter/material.dart';

class User with ChangeNotifier {
  String? id;
  String? fullName;
  String? nationalNumber;
  String? phoneNumber;
  String? email;
  String? password;
  String? nameCar;
  String? type;
  String? category;
  String? engineNumber;
  String? passengerNumber;
  String? carNumber;

  User({
    required this.id,
    required this.fullName,
    required this.nationalNumber,
    required this.phoneNumber,
    required this.email,
    required this.password,
  });
}
