// ignore_for_file: use_rethrow_when_possible, avoid_print

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
//import 'dart:math';

class Tank with ChangeNotifier {
  int _percentage = 0;
  int _amounts = 0;

  Future<void> setPercentage() async {
    var url = Uri.parse('http://192.168.68.28:7882/api/admin/get_amount');
    try {
      var response = await http.get(url);
      //print(response.body);
      var decoded = convert.jsonDecode(response.body) as List<dynamic>;
      //print(decoded);
      _percentage = decoded[0];
      _amounts = decoded[1];
      /* _percentage = Random().nextInt(100);
    if (_percentage < 20) {
      _percentage = 20;
    }
    _amounts = Random().nextInt(100);
    if (_amounts < 20) {
      _amounts = 20;
    }*/
      notifyListeners();
    } catch (error) {
      print(error);
      throw (error);
    }
  }

  int get percentage {
    return _percentage;
  }

  int get amount {
    return _amounts;
  }

  Future<void> refill() async {
    var url = Uri.parse('http://192.168.1.8:7882/api/admin/dd');
    try {
      await http.post(url);
    } catch (error) {
      throw (error);
    }
  }
}
