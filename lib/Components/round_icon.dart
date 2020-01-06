import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  IconData RoundButton;
  final Function onPressed;

  RoundIconButton({this.RoundButton, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      fillColor: Color(0XFF4C4F5E),
      elevation: 6.0,
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      child: Icon(RoundButton),
    );
  }
}
