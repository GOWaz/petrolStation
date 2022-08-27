// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:stationapp/constants.dart';
import 'package:stationapp/providers/report_provider/report.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ReportsProvider with ChangeNotifier {
  List<Report> _reports = [];

  Future<void> fetchReports() async {
    var url = Uri.parse('http://$ip:7882/api/admin/get_compo');
    try {
      final response = await http.get(url);
      //print(response.body);
      final extractedData = json.decode(response.body) as List<dynamic>;
      List<Report> exReport = [];
      for (int i = 0; i < extractedData.length; i++) {
        //print(extractedData[i]);
        final extractedReport = Report(
          id: extractedData[i]['id'],
          report: extractedData[i]['complaint'],
        );
        exReport.add(extractedReport);
      }
      _reports = exReport;
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  List<Report> get reports {
    return [..._reports.reversed];
  }

  Report findById(int id) {
    return _reports.firstWhere((report) => report.id == id);
  }
}
