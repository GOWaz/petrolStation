import 'package:flutter/material.dart';
import 'package:userapp/pages/Payment/payment_container.dart';

import '../../constants.dart';
import '../home page/home_page.dart';

class Payment extends StatelessWidget {
  
  const Payment({Key? key}) : super(key: key);
  static const routeName = '/Payment';
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
          shadowColor: Colors.amber,
          backgroundColor: Colors.white,
          title: const Text(
            'Payment',
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
              alignment: Alignment.center,
              color: color1,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'your payment history',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: color3),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
         const  PaymentContainer(price: 15000, name: 'Malak Naef', date: '12/2/2009', quantity: 40),
            const SizedBox(
              height: 30,
            ),
             const  PaymentContainer(price: 20000, name: 'Malak Naef', date: '12/2/2013', quantity: 60),
           
          ],
        ));
  }
}
