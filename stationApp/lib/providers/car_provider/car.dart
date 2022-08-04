import 'package:flutter/material.dart';

class Car with ChangeNotifier {
  final String id;
  final String ownerId;
  final String carName;
  final String carNumber;
  final String owner;
  //final String type;
  final String category;
  final int amount;
  //final DateTime manufacturingYear;
  //final String engineNumber;
  //final int passengersNumber;

  @override
  Car({
    required this.id,
    required this.ownerId,
    required this.carName,
    required this.carNumber,
    required this.owner,
    //required this.type,
    required this.category,
    required this.amount,
    //required this.manufacturingYear,
    //required this.engineNumber,
    //required this.passengersNumber,
  });
}
