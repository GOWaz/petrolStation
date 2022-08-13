// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:stationapp/providers/bill_provider/bill.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BillsProvider with ChangeNotifier {
  // ignore: prefer_final_fields
  List<Bill> _bills = [];

  Future<void> fetchPills() async {
    var url = Uri.parse('http://192.168.1.8:7882/api/admin/get_all_bill');
    try {
      final response = await http.get(url);
      //print(response.body);
      final extractedData = json.decode(response.body) as List<dynamic>;
      print(extractedData);
      List<Bill> exBill = [];
      for (int i = 0; i < extractedData.length; i++) {
        final bill = Bill(
            id: extractedData[i]['id'],
            amount: extractedData[i]['amount'],
            payment: extractedData[i]['payment'],
            userID: extractedData[i]['user_id'],
            employeeID: extractedData[i]['employee_id']);
        exBill.add(bill);
      }
      _bills = exBill;
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  List<Bill> get bills {
    return [..._bills];
  }
}
