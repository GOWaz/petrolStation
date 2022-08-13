import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:stationapp/constants.dart';
import 'package:stationapp/providers/report_provider/report.dart';
import 'package:stationapp/providers/report_provider/reports_provider.dart';

class ReportDetails extends StatelessWidget {
  const ReportDetails({Key? key}) : super(key: key);

  static const routeName = '/reportDetails';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    var report = Report(id: 0, report: '');
    final reportID = ModalRoute.of(context)!.settings.arguments as int;
    if (reportID.isNaN) {
      Navigator.pop(context);
    } else {
      report = Provider.of<ReportsProvider>(context).findById(reportID);
    }

    return Scaffold(
      backgroundColor: color1,
      appBar: AppBar(
        backgroundColor: color5,
        title: Text('Report Number: ${report.id}'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          height: size.height * 0.8,
          width: size.width / 3,
          color: color5,
          child: Center(
            child: Text(
              report.report,
              style:
                  GoogleFonts.inter(color: color4, fontSize: size.height / 30),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
