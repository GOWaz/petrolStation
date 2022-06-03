import 'package:flutter/material.dart';
import 'package:stationapp/constants.dart';

class SignInButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPress;

  const SignInButton({
    required this.text,
    required this.onPress,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            primary: color2,
            fixedSize: const Size(150, 50)),
        child: Text(
          style: const TextStyle(fontSize: 20),
          text!,
        ),
      ),
    );
  }
}
