import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stationapp/constants.dart';

class Field extends StatelessWidget {
  final String? hint;
  final bool secureText;
  const Field({
    required this.hint,
    this.secureText = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.inter(
            fontSize: 20,
            color: color3,
            fontWeight: FontWeight.bold,
          ),
          filled: true,
          fillColor: color1,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(0)),
            borderSide: BorderSide.none,
          ),
        ),
        obscureText: secureText,
      ),
    );
  }
}
