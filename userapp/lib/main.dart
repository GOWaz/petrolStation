import 'package:fill_me/pages/home_page.dart';
import 'package:fill_me/pages/sign_in.dart';
import 'package:fill_me/pages/sign_up.dart';
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
      home: const SignIn(),
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        SignIn.routeName: (context) => const SignIn(),
        SignUp.routeName: (context) => const SignUp(),
      },
    );
  }
}
