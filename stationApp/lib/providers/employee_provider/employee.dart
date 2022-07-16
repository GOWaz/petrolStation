import 'package:flutter/material.dart';

class Employee with ChangeNotifier {
  final String id;
  final String fullName;
  final String job;

  @override
  Employee({
    required this.id,
    required this.fullName,
    required this.job,
  });
}
