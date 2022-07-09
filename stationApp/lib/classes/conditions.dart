import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stationapp/constants.dart';

viewStatus(value) {
  if (value >= 20 && value <= 25) {
    return Image.asset('images/quarter.png');
  } else if (value >= 25 && value <= 50) {
    return Image.asset('images/half.png');
  } else if (value >= 50 && value <= 75) {
    return Image.asset('images/threeQuarter.png');
  } else {
    return Image.asset('images/full.png');
  }
}

viewStatusColor(value) {
  if (value >= 20 && value <= 25) {
    return Colors.red;
  } else if (value >= 25 && value <= 50) {
    return Colors.yellow;
  } else if (value >= 50 && value <= 75) {
    return Colors.green;
  } else {
    return Colors.green;
  }
}

viewStatusMessage(BuildContext context, value) {
  final size = MediaQuery.of(context).size;

  var conditionsTextStyle = GoogleFonts.inter(
    color: color2,
    fontWeight: FontWeight.bold,
    fontSize: size.height / 30,
  );

  if (value == 20) {
    return Row(
      children: [
        const Icon(
          Icons.warning,
          color: Colors.red,
          size: 50,
        ),
        Text(
          ' Warning the Fuel Percentage is $value%  '
          '\n your Tank almost empty!! '
          '\n you need to refill the Tank.',
          style: conditionsTextStyle,
        ),
      ],
    );
  } else if (value > 20 && value <= 25) {
    return Text(
      'You\'ve used almost three quarter of your Tank!',
      style: conditionsTextStyle,
    );
  } else if (value > 25 && value < 50) {
    return Text(
      'Under half of your Fuel left in the Tank!',
      style: conditionsTextStyle,
    );
  } else if (value == 50) {
    return Text(
      'You\'ve used half of your Fuel!',
      style: conditionsTextStyle,
    );
  } else if (value > 50 && value <= 75) {
    return Text(
      'Almost three quarter of Fuel left in your Tank!',
      style: conditionsTextStyle,
    );
  } else if (value > 75 && value < 100) {
    return Text(
      'The Fuel Percentage is $value% almost full!',
      style: conditionsTextStyle,
    );
  } else {
    return Text(
      'The Tank Percentage is $value% it\'s full!',
      style: conditionsTextStyle,
    );
  }
}
