import 'package:flutter/material.dart';
import 'package:side_navigation/side_navigation.dart';
import 'package:stationapp/constants.dart';
import 'package:stationapp/widgets/tank_state.dart';

//enum Status { quarter, half, threeQuarter, full }

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  static const routeName = '/mainPage';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //list of pages we will handle in the side navigation bar
  List<Widget> views = const [
    TankState(),
    Center(
      child: Text('Notifications'),
    ),
    Center(
      child: Text('Income Status'),
    ),
    Center(
      child: Text('Employees'),
    ),
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: color1,
      body: SafeArea(
        child: Row(
          children: [
            SideNavigationBar(
              theme: SideNavigationBarTheme(
                backgroundColor: color2,
                togglerTheme: SideNavigationBarTogglerTheme.standard(),
                dividerTheme: SideNavigationBarDividerTheme.standard(),
                itemTheme: const SideNavigationBarItemTheme(
                  selectedItemColor: color1,
                  unselectedItemColor: Colors.black,
                ),
              ),
              selectedIndex: selectedIndex,
              items: const [
                SideNavigationBarItem(
                  icon: Icons.local_gas_station,
                  label: 'Tank State',
                ),
                SideNavigationBarItem(
                  icon: Icons.circle_notifications,
                  label: 'Notifications',
                ),
                SideNavigationBarItem(
                  icon: Icons.trending_up,
                  label: 'Income Status',
                ),
                SideNavigationBarItem(
                  icon: Icons.badge,
                  label: 'Employees',
                )
              ],
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
            Expanded(
              child: views.elementAt(selectedIndex),
            )
          ],
        ),
      ),
    );
  }
}
