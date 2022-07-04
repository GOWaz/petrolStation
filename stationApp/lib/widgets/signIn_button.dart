// ignore_for_file: file_names

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
    final size = MediaQuery.of(context).size;
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary: color2,
          fixedSize: Size(size.width / 8, size.height / 16)),
      child: Text(
        style: const TextStyle(fontSize: 20),
        text!,
      ),
    );
  }
}
