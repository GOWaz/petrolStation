import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stationapp/pages/about.dart';
import 'package:stationapp/pages/received.dart';
import 'package:stationapp/pages/report_pages/reports_page.dart';
import 'package:stationapp/widgets/bill_widget/bill_list_view.dart';
import 'package:stationapp/widgets/employee_widget/employee_list_view.dart';
import 'package:stationapp/widgets/tank_state.dart';
import 'package:stationapp/widgets/user_widgets/users_list_view.dart';

List<Widget> views = const [
  TankState(),
  ReceivedMessagePage(),
  BillView(),
  EmployeesListView(),
  UsersListView(),
  ReportsPage(),
  About(),
];

InputDecoration fieldDecoration(String hint) {
  return InputDecoration(
    hintText: hint,
    hintStyle: GoogleFonts.inter(
      fontSize: 20,
      color: color1,
      fontWeight: FontWeight.bold,
    ),
    filled: true,
    fillColor: color5,
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(0)),
      borderSide: BorderSide.none,
    ),
  );
}

labelStyleInUserInfo(BuildContext ctx) {
  final size = MediaQuery.of(ctx).size;
  return GoogleFonts.adamina(
    color: color1,
    fontSize: size.height / 24,
    fontWeight: FontWeight.bold,
  );
}

detailsStyleInUserInfo(BuildContext ctx) {
  final size = MediaQuery.of(ctx).size;
  return GoogleFonts.inter(
    color: Colors.white,
    fontSize: size.height / 16,
  );
}

const color1 = Color(0xFFFFDA6A);
const color2 = Color(0xFF00656B);
const color3 = Color(0xFF757575);

const color4 = Color(0xFFFFC107);
const color5 = Color(0xFF00796B);
const color6 = Color(0xFF797771);

const ip = '192.168.68.28';

//192.168.1.107
//192.168.43.198
//192.168.43.230
//192.168.68.28
