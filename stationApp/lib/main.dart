import 'package:flutter/material.dart';
import 'package:stationapp/pages/entry_page.dart';
import 'package:provider/provider.dart';
import 'package:stationapp/pages/mani_page.dart';
import 'package:stationapp/providers/tank.dart';

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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const EntryPage(),
        routes: {
          MainPage.routeName: (ctx) => const MainPage(),
        },
      ),
    );
  }
}
