import 'package:flutter/material.dart';

class Report with ChangeNotifier {
  final int id;
  final String report;

  @override
  Report({
    required this.id,
    required this.report,
  });
}
