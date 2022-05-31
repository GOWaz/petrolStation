import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:userapp/constants.dart';

class PageUpperSide extends StatelessWidget {
  final String? title;
  const PageUpperSide({
    required this.title,
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        Container(
          height: size.height / 3,
          width: size.width,
          decoration: const BoxDecoration(
            color: color1,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
          child: Center(
            child: Text(
              title!,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 80,
                color: color2,
              ),
            ),
          ),
        ),
        const Positioned(
          top: 190,
          child: CircleAvatar(
            backgroundColor: Colors.teal,
            radius: 80,
            backgroundImage: AssetImage('images/CircleAvatar.jpg'),
          ),
        ),
      ],
    );
  }
}
