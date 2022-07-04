import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stationapp/constants.dart';
import 'package:stationapp/pages/mani_page.dart';
import 'package:stationapp/widgets/field.dart';
import 'package:stationapp/widgets/signIn_button.dart';

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
                      SizedBox(
                        height: size.height / 8,
                      ),
                      const Field(hint: "Username"),
                      const Field(hint: "Password", secureText: true),
                      SignInButton(
                          text: 'Login',
                          onPress: () {
                            Navigator.pushNamed(context, MainPage.routeName);
                          })
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
                        'Welcome !',
                        style: GoogleFonts.inter(
                          fontSize: 30,
                          color: color4,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: size.height / 14,
                      ),
                      Text(
                        'If you haven\'t purchase a key feel free to contact us',
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: size.height / 14,
                      ),
                      Text(
                        'LINK',
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          color: Colors.lightBlueAccent,
                        ),
                      ),
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
