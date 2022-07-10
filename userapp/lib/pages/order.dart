import 'package:flutter/material.dart';

class Order extends StatelessWidget {
  const Order({Key? key}) : super(key: key);
static const routeName = '/Order';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.amber,
        backgroundColor: Colors.white,
        title:const Text('order',style: TextStyle(color: Colors.black),),
        ),
    );
  }
}