import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
//import 'dart:convert' as convert;
import 'dart:math';

class Tank with ChangeNotifier {
  int _percentage = 0;
  int _amounts = 0;

  void setPercentage() async {
    /*var url = Uri.parse('http://192.168.1.2:7882/api/admin/get_amount#');
    var response = await http.get(url);
    var decoded = convert.jsonDecode(response.body) as List<dynamic>;
    _percentage = decoded[0];
    _amounts = decoded[1];*/
    _percentage = Random().nextInt(100);
    if (_percentage < 20) {
      _percentage = 20;
    }
    _amounts = Random().nextInt(100);
    if (_amounts < 20) {
      _amounts = 20;
    }
    //notifyListeners();
  }

  int get percentage {
    return _percentage;
  }

  int get amount {
    return _amounts;
  }
}
