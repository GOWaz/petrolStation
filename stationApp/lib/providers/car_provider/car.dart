import 'package:flutter/material.dart';

class Car with ChangeNotifier {
  String? id;
  String? carName;
  String? carNumber;
  String? owner;
  String? type;
  String? category;
  int? amount;
  DateTime? manufacturingYear;
  String? engineNumber;
  String? passengersNumber;

  @override
  Car({
    required this.id,
    required this.carName,
    required this.carNumber,
    required this.owner,
    required this.type,
    required this.category,
    required this.amount,
    required this.manufacturingYear,
    required this.engineNumber,
    required this.passengersNumber,
  });
}
