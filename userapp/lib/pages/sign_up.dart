import 'package:fill_me/pages/home_page.dart';
import 'package:fill_me/widgets/page_upper_side.dart';
import 'package:fill_me/widgets/sign_in_up_button.dart';
import 'package:flutter/material.dart';
import 'package:fill_me/widgets/field.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  static const routeName = '/SignUp';

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var addCar = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              PageUpperSide(title: 'SignUp', size: size),
              const SizedBox(height: 100),
              const Field(
                hint: 'First name',
              ),
              const Field(
                hint: 'Last name',
              ),
              const Field(
                hint: 'Phone number',
              ),
              const Field(
                hint: 'password',
                secureText: true,
              ),
              const Field(
                hint: 'confirm password',
                secureText: true,
              ),
              SignInUpButton(
                text: 'SignUp',
                onPress: () {
                  Navigator.of(context).pushNamed(HomePage.routeName);
                },
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
