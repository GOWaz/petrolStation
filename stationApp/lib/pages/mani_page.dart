import 'package:flutter/material.dart';
import 'package:side_navigation/side_navigation.dart';
import 'package:stationapp/constants.dart';
import 'package:stationapp/widgets/tank_state.dart';
import 'package:stationapp/widgets/user/users_list_view.dart';

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
    UsersListView(),
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
                ),
                SideNavigationBarItem(
                  icon: Icons.group,
                  label: 'User',
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
