// ignore_for_file: prefer_final_fields, avoid_print, use_rethrow_when_possible

import 'package:flutter/material.dart';
import 'package:stationapp/constants.dart';
import 'package:stationapp/providers/user_provider/user_received_message.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ReceivedMessageProvider with ChangeNotifier {
  List<ReceivedMessage> _users = [];

  Future<void> fetch() async {
    var url = Uri.parse('http://$ip:7882/api/admin/getReciveMessage');
    try {
      final response = await http.get(url);
      //print(response.body);
      var extractedData = json.decode(response.body) as List<dynamic>;
      List<ReceivedMessage> exRM = [];
      for (int i = 0; i < extractedData.length; i++) {
        final extractedInfo = ReceivedMessage(
            id: extractedData[i]['id'],
            userId: extractedData[i]['user_id'],
            verify: extractedData[i]['varifty']);
        exRM.add(extractedInfo);
      }
      _users = exRM;
      notifyListeners();
    } catch (error) {
      print(error);
      throw (error);
    }
  }

  List<ReceivedMessage> get usersWithMassages {
    return [..._users];
  }
}
