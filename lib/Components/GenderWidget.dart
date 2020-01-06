import 'package:flutter/material.dart';
import 'package:bmi_app/constants.dart';

class GenderWidget extends StatelessWidget {
  GenderWidget({this.iconWidget, this.Gender});
  final IconData iconWidget;
  final String Gender;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconWidget,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          Gender,
          style: kLabelTextSytle,
        )
      ],
    );
  }
}
