import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:stationapp/classes/conditions.dart';
import 'package:stationapp/constants.dart';
import 'package:stationapp/providers/tank.dart';

class TankState extends StatefulWidget {
  const TankState({Key? key}) : super(key: key);

  @override
  State<TankState> createState() => _TankStateState();
}

class _TankStateState extends State<TankState> {
  var _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final tankPercentage = Provider.of<Tank>(context);
      tankPercentage.setPercentage();
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final tankPercentage = Provider.of<Tank>(context);
    int percentage = tankPercentage.percentage;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background2.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  height: size.height / 2,
                  width: size.width / 6,
                  child: viewStatus(percentage),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: SizedBox(
                        child: Text(
                          '${percentage.toString()} %',
                          style: GoogleFonts.inter(
                              color: viewStatusColor(percentage),
                              fontSize: size.height / 20),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.width / 2,
                      child: viewStatusMessage(context, percentage),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: TextButton(
                onPressed: () {},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: color5,
                  ),
                  height: size.height / 16,
                  width: size.width / 8,
                  child: Center(
                    child: Text(
                      'Refill',
                      style: TextStyle(
                        color: color1,
                        fontSize: size.height / 26,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
