import 'package:flutter/material.dart';

class User with ChangeNotifier {
  final int id;
  final String fullName;
  final String nationalNumber;
  final String phoneNumber;
  final String email;
  final String password;
  final int carId;
  final int ownerId;
  final String carName;
  final String carNumber;
  final String category;
  final int amount;

  @override
  User({
    required this.id,
    required this.fullName,
    required this.nationalNumber,
    required this.phoneNumber,
    required this.email,
    required this.password,
    required this.carId,
    required this.ownerId,
    required this.carName,
    required this.carNumber,
    required this.category,
    required this.amount,
  });
}
