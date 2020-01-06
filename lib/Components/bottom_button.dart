import 'package:flutter/material.dart';
import 'package:bmi_app/constants.dart';

class BottomButton extends StatelessWidget {
  final Function onTap;
  final String buttonName;

  BottomButton({this.buttonName, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonName,
            style: TextStyle(
              fontSize: 25.0,
            ),
          ),
        ),
        color: kBottomContainer,
        margin: EdgeInsets.only(top: 15.0),
        width: double.infinity,
        height: 45,
      ),
    );
  }
}
