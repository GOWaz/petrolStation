import 'package:flutter/material.dart';
import 'package:stationapp/providers/car_provider/car.dart';

class CarsProvider with ChangeNotifier {
  // ignore: prefer_final_fields
  List<Car> _cars = [
    Car(
      id: '',
      ownerId: '',
      carName: '',
      carNumber: '',
      owner: '',
      type: '',
      category: '',
      amount: 0,
      manufacturingYear: DateTime.now(),
      engineNumber: '',
      passengersNumber: 0,
    ),
  ];

  List<Car> get cars {
    return [..._cars];
  }

  void addCar(Car car) {
    _cars.add(car);
    notifyListeners();
  }

  Car findById(String id) {
    return _cars.firstWhere((car) => car.ownerId == id, orElse: () => _cars[0]);
  }

  Car findByName(String name) {
    return _cars.firstWhere((car) => car.owner == name, orElse: () => _cars[0]);
  }

  void deleteCarByID(id) {
    var car =
        _cars.firstWhere((car) => car.ownerId == id, orElse: () => _cars[0]);
    if (car.id == '') {
      return;
    }
    _cars.removeWhere((car) => car.ownerId == id);
    notifyListeners();
  }
}
