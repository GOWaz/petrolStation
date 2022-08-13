// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:stationapp/pages/report_pages/report_details.dart';

class ReportItem extends StatelessWidget {
  int? id;
  ReportItem({required this.id, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () =>
          Navigator.pushNamed(context, ReportDetails.routeName, arguments: id),
      leading: const Icon(
        Icons.warning,
        color: Colors.red,
      ),
      title: Text(id.toString()),
    );
  }
}
