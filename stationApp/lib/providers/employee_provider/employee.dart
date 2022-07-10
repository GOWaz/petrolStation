import 'package:flutter/material.dart';

class Employee with ChangeNotifier {
  String? id;
  String? fullName;
  String? job;

  @override
  Employee({
    required this.id,
    required this.fullName,
    required this.job,
  });
}
