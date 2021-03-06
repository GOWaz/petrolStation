import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stationapp/constants.dart';
import 'package:stationapp/widgets/field.dart';
import 'package:stationapp/widgets/signIn_button.dart';

import 'create_account_page.dart';

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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'SignIn',
                        style: GoogleFonts.inter(fontSize: 60, color: color2),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 60, right: 60),
                        child: Field(hint: "Username"),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 60, right: 60),
                        child: Field(hint: "Password", secureText: true),
                      ),
                      SignInButton(text: 'Login', onPress: () {})
                    ],
                  ),
                ),
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
                        'Hello Friend !',
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
                        'Enter Your Personal Details and Start Journey with Us',
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SignInButton(text: 'SingUp', onPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const CreateAccount()),
                        );
                      })
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
