// ignore_for_file: use_rethrow_when_possible, avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:stationapp/classes/conditions.dart';
import 'package:stationapp/classes/storage.dart';
import 'package:stationapp/constants.dart';
import 'package:stationapp/providers/employee_provider/employee_provider.dart';
import 'package:stationapp/providers/tank.dart';

class TankState extends StatefulWidget {
  const TankState({Key? key}) : super(key: key);

  @override
  State<TankState> createState() => _TankStateState();
}

class _TankStateState extends State<TankState> {
  Future<void> fetchAll() async {
    try {
      await Provider.of<EmployeesProvider>(context).fetchEmployees();
    } catch (error) {
      print(error);
    }
  }

  var storage = Storage();
  final _name = TextEditingController(text: '');
  Future<void> _updateState(BuildContext context) async {
    setState(() {
      _isLoading = true;
    });
    try {
      await Provider.of<Tank>(context, listen: false).setPercentage();
    } catch (error) {
      //print(error);
      await showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('An error occurred!'),
          content: const Text('Something went wrong.'),
          actions: <Widget>[
            TextButton(
              child: const Text('Okay'),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
            )
          ],
        ),
      );
    }
    setState(() {
      _isLoading = false;
    });
  }

  var _isInit = true;
  var _isLoading = true;

  @override
  Future<void> didChangeDependencies() async {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      try {
        await Provider.of<Tank>(context).setPercentage();
        _name.text = await storage.storage.read(key: "ADMINNAME") ?? '';
      } catch (error) {
        //print(error);
        await showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('An error occurred!'),
            content: const Text('Something went wrong.'),
            actions: <Widget>[
              TextButton(
                child: const Text('Okay'),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              )
            ],
          ),
        );
      }
    }
    setState(() {
      _isLoading = false;
    });
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final tankStatus = Provider.of<Tank>(context);
    int percentage = tankStatus.percentage;
    int amount = tankStatus.amount;

    return Scaffold(
      backgroundColor: color1,
      appBar: AppBar(
        backgroundColor: color5,
        title: Text(_name.text),
        actions: [
          IconButton(
              onPressed: () => _updateState(context),
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    Container(
                      margin: const EdgeInsets.only(left: 20.0),
                      padding: const EdgeInsets.all(10),
                      height: size.height / 8,
                      width: size.width / 4,
                      decoration: const BoxDecoration(
                          color: color2,
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      child: Column(
                        children: [
                          Text(
                            'Fuel left in the tank:',
                            style: GoogleFonts.inter(
                                color: color1,
                                fontSize: size.height / 30,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '$amount',
                            style: GoogleFonts.inter(
                                color: color1,
                                fontSize: size.height / 25,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextButton(
                        onPressed: () async {
                          try {
                            await tankStatus.refill();
                          } catch (error) {
                            await showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                title: const Text('An error occurred!'),
                                content: const Text('Something went wrong.'),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text('Okay'),
                                    onPressed: () {
                                      Navigator.of(ctx).pop();
                                    },
                                  )
                                ],
                              ),
                            );
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: color6,
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
            ),
    );
  }
}

/*
setState(() async {
try {
await tankStatus.setPercentage();
} catch (error) {
print(error);
await showDialog(
context: context,
builder: (ctx) => AlertDialog(
title: const Text('An error occurred!'),
content: const Text('Something went wrong.'),
actions: <Widget>[
TextButton(
child: const Text('Okay'),
onPressed: () {
Navigator.of(ctx).pop();
},
)
],
),
);
}
});*/
