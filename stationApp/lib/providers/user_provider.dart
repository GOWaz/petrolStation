import 'package:flutter/material.dart';
import 'package:stationapp/classes/user.dart';

class UsersProvider with ChangeNotifier {
  // ignore: prefer_final_fields
  List<User> _users = [
    User(
      id: '1',
      fullName: 'abd',
      nationalNumber: '123',
      phoneNumber: '0202',
      email: 'email',
      password: 'password',
    ),
    User(
      id: '2',
      fullName: 'fullName',
      nationalNumber: 'nationalNumber',
      phoneNumber: 'phoneNumber',
      email: 'email',
      password: 'password',
    ),
  ];

  List<User> get users {
    return [..._users];
  }

  User findById(String id) {
    return _users.firstWhere((user) => user.id == id);
  }
}
