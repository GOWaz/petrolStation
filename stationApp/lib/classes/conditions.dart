import 'package:flutter/material.dart';
import 'package:stationapp/constants.dart';

viewStatus(value) {
  if (value >= 20 && value <= 25) {
    return Image.asset('images/quarter.png');
  } else if (value >= 25 && value <= 50) {
    return Image.asset('images/half.png');
  } else if (value >= 50 && value <= 75) {
    return Image.asset('images/threeQuarter.png');
  } else {
    return Image.asset('images/full.jpg');
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

viewStatusMessage(value) {
  if (value == 20) {
    return Row(
      children: [
        const Icon(
          Icons.warning,
          color: Colors.red,
          size: 50,
        ),
        Text(
          ' Warning the Tank Percentage is $value% almost empty!! \n'
          ' you need to refill the tank.',
          style: conditionsTextStyle,
        ),
      ],
    );
  } else if (value > 25 && value < 50) {
    return Text(
      'The Tank Percentage is $value% under half of the Tank have been used!',
      style: conditionsTextStyle,
    );
  } else if (value == 50) {
    return Text(
      'The Tank Percentage is $value% half of the Tank have been used!',
      style: conditionsTextStyle,
    );
  } else if (value > 50 && value < 100) {
    return Text(
      'The Tank Percentage is $value% almost full!',
      style: conditionsTextStyle,
    );
  } else {
    return Text(
      'The Tank Percentage is $value% it\'s full!',
      style: conditionsTextStyle,
    );
  }
}
