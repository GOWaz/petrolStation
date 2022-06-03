import 'package:flutter/material.dart';
import 'package:stationapp/constants.dart';

class EntryPage extends StatelessWidget {
  const EntryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Row(
              children: [
                Container(
                  height: size.height,
                  width: size.width / 2,
                  color: Colors.white,
                ),
                Container(
                  height: size.height,
                  width: size.width / 2,
                  color: color2,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
