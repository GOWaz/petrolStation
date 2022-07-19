import 'package:flutter/material.dart';

class User with ChangeNotifier {
  final String id;
  final String fullName;
  final String nationalNumber;
  final String phoneNumber;
  final String email;
  final String password;

  @override
  User({
    required this.id,
    required this.fullName,
    required this.nationalNumber,
    required this.phoneNumber,
    required this.email,
    required this.password,
  });
}
