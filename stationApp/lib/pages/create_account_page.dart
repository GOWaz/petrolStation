import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stationapp/constants.dart';
import 'package:stationapp/widgets/field.dart';
import 'package:stationapp/widgets/signIn_button.dart';

import 'entery_page.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({Key? key}) : super(key: key);

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
                  color: color2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: size.height / 4,
                        width: size.width / 4,
                        child: Image.asset('images/CircleAvatar.jpg'),
                      ),
                      Text(
                        'Welcome !',
                        style: GoogleFonts.inter(
                          fontSize: 30,
                          color: color4,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'To Keep Connected Please Login with your personal info',
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SignInButton(text: 'Login', onPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const EntryPage()),
                        );
                      })
                    ],
                  ),
                ),
                Container(
                  height: size.height,
                  width: size.width / 2,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Create Account',
                        style: GoogleFonts.inter(fontSize: 60, color: color2),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 60, right: 60),
                        child: Field(hint: "Name"),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 60, right: 60),
                        child: Field(hint: "Email"),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 60, right: 60),
                        child: Field(hint: "Password", secureText: true),
                      ),
                      SignInButton(text: 'Signup', onPress: () {})
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
