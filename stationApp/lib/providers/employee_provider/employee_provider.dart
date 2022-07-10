import 'package:flutter/material.dart';
import 'package:stationapp/providers/employee_provider/employee.dart';

class EmployeesProvider with ChangeNotifier {
  // ignore: prefer_final_fields
  List<Employee> _employees = [
    Employee(id: '1', fullName: 'gow', job: 'job'),
    Employee(id: '2', fullName: 'Obama', job: 'job'),
    Employee(id: '3', fullName: 'Abd', job: 'job'),
    Employee(id: '4', fullName: 'Malek', job: 'job'),
    Employee(id: '5', fullName: 'Rana', job: 'job'),
  ];

  List<Employee> get employees {
    return [..._employees];
  }

  void addEmployee(Employee emp) {
    _employees.add(emp);
    notifyListeners();
  }

  void deleteEmployee(id) {
    _employees.removeWhere((emp) => emp.id == id);
    notifyListeners();
  }
}
