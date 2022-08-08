// ignore_for_file: avoid_print, use_rethrow_when_possible, unused_local_variable

import 'package:flutter/material.dart';
import 'package:stationapp/providers/employee_provider/employee.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EmployeesProvider with ChangeNotifier {
  // ignore: prefer_final_fields
  List<Employee> _employees = [
    /*Employee(id: '1', fullName: 'gow', job: 'job'),
    Employee(id: '2', fullName: 'Obama', job: 'job'),
    Employee(id: '3', fullName: 'Malek', job: 'job'),
    Employee(id: '4', fullName: 'Rana', job: 'job'),*/
  ];

  List<Employee> get employees {
    return [..._employees];
  }

  Future<void> fetchEmployees() async {
    var url =
        Uri.parse('http://192.168.43.230:7882/api/admin/get_all_empoloyee');
    try {
      final response = await http.get(url);
      //print(response.body);
      final extractedData = json.decode(response.body) as List<dynamic>;
      List<Employee> exEmp = [];
      for (int i = 0; i < extractedData.length; i++) {
        //print('\n${extractedData[i]}');
        final extractedEmp = Employee(
            id: extractedData[i]['id'].toString(),
            fullName: extractedData[i]['full_name'],
            job: extractedData[i]['job']);
        exEmp.add(extractedEmp);
      }
      _employees = exEmp;
      /*final List<Employee> loadedEmployees = [];
      extractedData.forEach((empId, empData) {
        loadedEmployees.add(Employee(
            id: empId.toString(),
            fullName: empData['full_name'],
            job: empData['job']));
      });*/
      //_employees = loadedEmployees;
      notifyListeners();
    } catch (error) {
      print(error);
      throw (error);
    }
  }

  Employee findById(String id) {
    return _employees.firstWhere((emp) => emp.id == id);
  }

  Future<void> addEmployee(Employee emp) async {
    var url =
        Uri.parse('http://192.168.43.230:7882/api/admin/register_empoloyee');
    try {
      final response = await http.post(
        url,
        body: {'full_name': emp.fullName, 'job': emp.job},
      );
      //print(response.body);
      final extractedData = json.decode(response.body) as List<dynamic>;
      final addedEmp = Employee(
          id: extractedData[0]['id'].toString(),
          fullName: emp.fullName,
          job: emp.job);
      _employees.add(addedEmp);
      notifyListeners();
    } catch (error) {
      print(error);
      throw (error);
    }
  }

  Future<void> updateEmployee(String id, Employee updatedEmployee) async {
    int index = int.parse(id);
    var url = Uri.parse(
        'http://192.168.43.230:7882/api/empoloyee/edit_empoloyee/$index');
    try {
      final response = await http.post(url, body: {
        'full_name': updatedEmployee.fullName,
        'job': updatedEmployee.job,
      });
    } catch (error) {
      throw (error);
    }
    final employeeIndex = _employees.indexWhere((emp) => emp.id == id);
    if (employeeIndex >= 0) {
      _employees[employeeIndex] = updatedEmployee;
      notifyListeners();
    }
  }

  Future<void> deleteEmployee(id) async {
    int index = int.parse(id);
    var url = Uri.parse(
        'http://192.168.43.230:7882/api/admin/delete_empoloyee/$index');
    try {
      final response = await http.get(url);
      //print(response.body);
      _employees.removeWhere((emp) => emp.id == id);
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}

//192.168.1.107
//192.168.43.198
//192.168.43.230
