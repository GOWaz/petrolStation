import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';

class HomePageButtons extends StatelessWidget {
  final Icon? containerIcon;
  final String? label;
  final VoidCallback? onTap;
  const HomePageButtons({
    required this.onTap,
    required this.containerIcon,
    required this.label,
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: size.width / 3,
          width: size.width / 3,
          decoration: homePageContainersDecoration,
          child: Column(
            children: [
              containerIcon!,
              Text(
                label!,
                style: GoogleFonts.inter(
                    color: const Color(0xFFBDBDBD), fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
