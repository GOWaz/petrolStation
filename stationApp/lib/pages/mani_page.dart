import 'package:flutter/material.dart';
import 'package:side_navigation/side_navigation.dart';
import 'package:stationapp/constants.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  static const routeName = '/mainPage';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //list of pages we will handle in the side navigation bar

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
                backgroundColor: color5,
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
                  icon: Icons.format_list_numbered,
                  label: 'Queue State',
                ),
                SideNavigationBarItem(
                  icon: Icons.trending_up,
                  label: 'Income Status',
                ),
                SideNavigationBarItem(
                  icon: Icons.badge,
                  label: 'Employees',
                ),
                SideNavigationBarItem(
                  icon: Icons.group,
                  label: 'User',
                ),
                SideNavigationBarItem(
                  icon: Icons.circle_notifications,
                  label: 'Notifications',
                ),
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
