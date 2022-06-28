import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stationapp/providers/tank.dart';

enum Status { quarter, half, threeQuarter, full }

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  static const routeName = '/mainPage';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final tankPercentage = Provider.of<Tank>(context);
    tankPercentage.setPercentage();
    int percentage = tankPercentage.getPercentage();
    viewStatus() {
      if (percentage >= 20 && percentage <= 25) {
        return Image.asset('images/quarter.png');
      } else if (percentage >= 25 && percentage <= 50) {
        return Image.asset('images/half.png');
      } else if (percentage >= 50 && percentage <= 75) {
        return Image.asset('images/threeQuarter.png');
      } else {
        return Image.asset('images/full.jpg');
      }
    }

    return Scaffold(
      body: Center(
        child: viewStatus(),
      ),
    );
  }
}
