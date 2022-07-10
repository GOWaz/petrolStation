import 'package:flutter/material.dart';
import 'package:stationapp/providers/car_provider/car.dart';

class CarsProvider with ChangeNotifier {
  // ignore: prefer_final_fields
  List<Car> _cars = [
    Car(
      id: 'id',
      carName: 'carName',
      carNumber: 'carNumber',
      owner: 'owner',
      type: 'type',
      category: 'category',
      amount: 60,
      manufacturingYear: DateTime.now(),
      engineNumber: 'engineNumber',
      passengersNumber: 'passengersNumber',
    ),
  ];

  List<Car> get cars {
    return [..._cars];
  }
}
