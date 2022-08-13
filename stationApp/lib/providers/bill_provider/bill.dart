import 'package:flutter/material.dart';

class Bill with ChangeNotifier {
  final int id;
  final int amount;
  final int payment;
  final String userID;
  final String employeeID;

  @override
  Bill({
    required this.id,
    required this.amount,
    required this.payment,
    required this.userID,
    required this.employeeID,
  });
}
