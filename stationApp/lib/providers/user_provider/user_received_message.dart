import 'package:flutter/material.dart';

class ReceivedMessage with ChangeNotifier {
  final int id;
  final int userId;
  final int verify;

  @override
  ReceivedMessage({
    required this.id,
    required this.userId,
    required this.verify,
  });
}
