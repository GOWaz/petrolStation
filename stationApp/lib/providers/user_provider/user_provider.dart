// ignore_for_file: avoid_print, use_rethrow_when_possible, unused_local_variable

import 'package:flutter/material.dart';
import 'package:stationapp/classes/storage.dart';
import 'package:stationapp/constants.dart';
import 'package:stationapp/providers/user_provider/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UsersProvider with ChangeNotifier {
  // ignore: prefer_final_fields
  List<User> _users = [];

  Future<void> fetchUsers() async {
    var url = Uri.parse('http://$ip:7882/api/admin/get_all_user');
    try {
      final response = await http.get(url);
      //print(response.body);
      final extractedData = json.decode(response.body) as List<dynamic>;
      //print(extractedData[0]['info']['id']);
      List<User> exUser = [];
      for (int i = 0; i < extractedData.length; i++) {
        final extractedUser = User(
            id: extractedData[i]['id'],
            fullName: extractedData[i]['full_name'],
            nationalNumber: extractedData[i]['national_number'],
            phoneNumber: extractedData[i]['phone_number'],
            email: extractedData[i]['email'],
            password: 'extractedData[i][' ']',
            carId: extractedData[i]['info']['id'],
            ownerId: int.parse(extractedData[i]['info']['owner']),
            carName: extractedData[i]['info']['name_car'],
            carNumber: extractedData[i]['info']['car_number'],
            category: extractedData[i]['info']['type'],
            amount: extractedData[i]['info']['amount']);
        exUser.add(extractedUser);
      }
      _users = exUser;
      notifyListeners();
    } catch (error) {
      print(error);
      throw (error);
    }
  }

  List<User> get users {
    return [..._users];
  }

  User findById(int id) {
    return _users.firstWhere((user) => user.id == id);
  }

  User findByName(String name) {
    return _users.firstWhere((user) => user.fullName == name);
  }

  Future<void> addUser(User user) async {
    var url = Uri.parse('http:/$ip:7882/api/admin/register_user');
    final storage = Storage();
    try {
      final api = TextEditingController(text: '');
      api.text = await storage.storage.read(key: "APITOKEN") ?? '';
      final response = await http.post(url, headers: {
        'auth-token': api.text
      }, body: {
        'full_name': user.fullName,
        'email': user.email,
        'phone_number': user.phoneNumber,
        'national_number': user.nationalNumber,
        'password': user.password,
        'name_car': user.carName,
        'car_number': user.carNumber,
        'type': user.category,
      });
      //print(response.body);
      final extractedData = json.decode(response.body) as List<dynamic>;
      //print(extractedData[1]['id']);
      final addedUser = User(
          id: extractedData[0]['id'],
          fullName: user.fullName,
          nationalNumber: user.nationalNumber,
          phoneNumber: user.phoneNumber,
          email: user.email,
          password: user.password,
          carId: extractedData[1]['id'],
          ownerId: extractedData[1]['owner'],
          carName: user.carName,
          carNumber: user.carNumber,
          category: user.category,
          amount: extractedData[1]['amount']);
      _users.add(addedUser);
      notifyListeners();
    } catch (error) {
      print(error);
      throw (error);
    }
  }

  Future<void> deleteUserByID(int id) async {
    var url = Uri.parse('http://$ip:7882/api/admin/delete_user_by_id/$id');
    final storage = Storage();
    try {
      final api = TextEditingController(text: '');
      api.text = await storage.storage.read(key: "APITOKEN") ?? '';
      final response = await http.delete(
        url,
        headers: {'auth-token': api.text},
      );
      print(response.body);
    } catch (error) {
      print(error);
      throw (error);
    }
    _users.removeWhere((user) => user.id == id);
    notifyListeners();
  }

  Future<void> updateUser(int id, User updatedUser) async {
    var url = Uri.parse('http://$ip:7882/api/admin/edit_user/$id');
    final storage = Storage();
    try {
      final api = TextEditingController(text: '');
      api.text = await storage.storage.read(key: "APITOKEN") ?? '';
      final response = await http.post(url, headers: {
        'auth-token': api.text
      }, body: {
        'full_name': updatedUser.fullName,
        'email': updatedUser.email,
        'phone_number': updatedUser.phoneNumber,
        'national_number': updatedUser.nationalNumber,
        'type': updatedUser.category,
        'name_car': updatedUser.carName,
        'car_number': updatedUser.carNumber,
      });
      //print(response.body);
      final userIndex = _users.indexWhere((user) => user.id == id);
      if (userIndex >= 0) {
        _users[userIndex] = updatedUser;
        notifyListeners();
      }
    } catch (error) {
      print(error);
      throw (error);
    }
  }
}
