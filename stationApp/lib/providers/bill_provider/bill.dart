import 'package:flutter/material.dart';

class Bill with ChangeNotifier {
  String? id;
  int? billNumber;
  double? amount;
  double? payment;
  DateTime? date;
  String? userID;
  String? employeeID;

  @override
  Bill({
    required this.id,
    required this.billNumber,
    required this.amount,
    required this.payment,
    required this.date,
    required this.userID,
    required this.employeeID,
  });
}
