import 'package:flutter/material.dart';
import 'package:stationapp/providers/bill_provider/bill.dart';

class BillsProvider with ChangeNotifier {
  // ignore: prefer_final_fields
  List<Bill> _bills = [
    Bill(
        id: '1',
        billNumber: 1,
        amount: 20.0,
        payment: 60000,
        date: DateTime.now(),
        userID: '1',
        employeeID: '1'),
    Bill(
        id: '2',
        billNumber: 2,
        amount: 20.0,
        payment: 60000,
        date: DateTime.now(),
        userID: '2',
        employeeID: '1'),
    Bill(
        id: '3',
        billNumber: 3,
        amount: 20.0,
        payment: 60000,
        date: DateTime.now(),
        userID: '3',
        employeeID: '1'),
    Bill(
        id: '4',
        billNumber: 4,
        amount: 20.0,
        payment: 60000,
        date: DateTime.now(),
        userID: '4',
        employeeID: '1'),
  ];

  List<Bill> get bills {
    return [..._bills];
  }
}
