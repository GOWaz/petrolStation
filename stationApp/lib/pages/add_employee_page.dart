import 'package:flutter/material.dart';
import 'package:stationapp/constants.dart';

class AddEmployee extends StatelessWidget {
  const AddEmployee({Key? key}) : super(key: key);

  static const routeName = '/addEmployee';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color1,
      appBar: AppBar(
        backgroundColor: color5,
        title: const Text('Hire an Employee'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.check_box),
          ),
        ],
      ),
      body: Form(
        child: Column(
          children: [
            Container(),
          ],
        ),
      ),
    );
  }
}
