import 'package:userapp/pages/home_page.dart';
import 'package:userapp/pages/map.dart';
import 'package:userapp/pages/on_boarding.dart';
import 'package:userapp/pages/order.dart';
import 'package:userapp/pages/payment.dart';
import 'package:userapp/pages/profile.dart';
import 'package:userapp/pages/report.dart';
import 'package:userapp/pages/setting.dart';
import 'package:userapp/pages/sign_in.dart';
import 'package:userapp/pages/sign_up.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const onBoarding(),
      routes: {
        HomePage.routeName: (context) =>  const HomePage(),
        SignIn.routeName: (context) => const SignIn(),
        SignUp.routeName: (context) => const SignUp(),
        onBoarding.routeName: (context) => const onBoarding(),
       Profile.routeName: (context) =>  const Profile(),
        Report.routeName: (context) =>  const Report(),
         Setting.routeName: (context) =>  const Setting(),
        Order.routeName: (context) =>  const Order(),
        Maps.routeName: (context) =>  const Maps(),
        Payment.routeName: (context) =>  const Payment(),

      },
    );
  }
}
