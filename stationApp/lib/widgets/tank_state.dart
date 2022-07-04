import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:stationapp/classes/conditions.dart';
import 'package:stationapp/providers/tank.dart';

class TankState extends StatefulWidget {
  const TankState({Key? key}) : super(key: key);

  @override
  State<TankState> createState() => _TankStateState();
}

class _TankStateState extends State<TankState> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final tankPercentage = Provider.of<Tank>(context);
    tankPercentage.setPercentage();
    int percentage = tankPercentage.getPercentage();

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                height: size.height / 6,
                width: size.width / 8,
                child: viewStatus(percentage),
              ),
              SizedBox(
                height: size.height / 10,
                child: LinearPercentIndicator(
                  width: size.width / 2,
                  animation: true,
                  lineHeight: 20.0,
                  animationDuration: 2000,
                  percent: percentage / 100,
                  center: Text('$percentage%'),
                  progressColor: viewStatusColor(percentage),
                ),
              ),
            ],
          ),
          SizedBox(
            width: size.width / 2,
            child: viewStatusMessage(percentage),
          )
        ],
      ),
    );
  }
}
