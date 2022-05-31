import 'package:fill_me/constants.dart';
import 'package:fill_me/pages/home_page.dart';
import 'package:fill_me/pages/sign_up.dart';
import 'package:fill_me/widgets/page_upper_side.dart';
import 'package:fill_me/widgets/sign_in_up_button.dart';
import 'package:flutter/material.dart';
import 'package:fill_me/widgets/field.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  static const routeName = '/SignIn';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              PageUpperSide(title: 'LogIn', size: size),
              const SizedBox(height: 100),
              const Field(
                hint: 'Your phone number',
              ),
              const Field(
                hint: 'Your password',
                secureText: true,
              ),
              SignInUpButton(
                text: 'Login',
                onPress: () {
                  Navigator.of(context).pushNamed(HomePage.routeName);
                },
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('You don\'t have an account?'),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(SignUp.routeName);
                    },
                    child: const Text(
                      'SignUp',
                      style: TextStyle(color: color2),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
