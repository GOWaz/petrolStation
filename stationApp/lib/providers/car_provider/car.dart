import 'package:flutter/material.dart';

class Car with ChangeNotifier {
  final String id;
  final String ownerId;
  final String carName;
  final String carNumber;
  final String owner;
  final String category;
  final int amount;

  @override
  Car({
    required this.id,
    required this.ownerId,
    required this.carName,
    required this.carNumber,
    required this.owner,
    required this.category,
    required this.amount,
  });
}
