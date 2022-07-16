import 'package:flutter/material.dart';
import 'package:stationapp/widgets/employee_widget/employee_list_view.dart';
import 'package:stationapp/widgets/tank_state.dart';
import 'package:stationapp/widgets/user_widgets/users_list_view.dart';

List<Widget> views = const [
  TankState(),
  Center(
    child: Text('Queue State'),
  ),
  Center(
    child: Text('Income Status'),
  ),
  EmployeesListView(),
  UsersListView(),
  Center(
    child: Text('Notifications'),
  ),
];

const color1 = Color(0xFFFFDA6A);
const color2 = Color(0xFF00656B);
const color3 = Color(0xFF757575);

const color4 = Color(0xFFFFC107);
const color5 = Color(0xFF00796B);
const color6 = Color(0xFF797771);
