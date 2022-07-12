import 'package:flutter/material.dart';
import 'package:stationapp/pages/add_employee_page.dart';
import 'package:stationapp/pages/entry_page.dart';
import 'package:provider/provider.dart';
import 'package:stationapp/pages/mani_page.dart';
import 'package:stationapp/pages/user_details_page.dart';
import 'package:stationapp/providers/employee_provider/employee_provider.dart';
import 'package:stationapp/providers/tank.dart';
import 'package:stationapp/providers/user_provider/user_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => Tank()),
        ChangeNotifierProvider(
            create: (BuildContext context) => UsersProvider()),
        ChangeNotifierProvider(
            create: (BuildContext context) => EmployeesProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const EntryPage(),
        routes: {
          MainPage.routeName: (ctx) => const MainPage(),
          UserDetails.routeName: (ctx) => UserDetails(),
          AddEmployee.routeName: (ctx) => const AddEmployee(),
        },
      ),
    );
  }
}
