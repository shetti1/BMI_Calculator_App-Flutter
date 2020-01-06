import 'package:flutter/material.dart';
import 'package:bmi_app/constants.dart';
import 'package:bmi_app/Components/ReusableWidget.dart';
import 'package:bmi_app/Components/bottom_button.dart';

class Result extends StatelessWidget {
  String bmi;
  String res;
  String interpretation;

  Result({this.bmi, this.res, this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.center,
              child: Text(
                'Your Result',
                style: kResultNumberStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableWidget(
              colour: kActivecolour,
              cardWidget: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    res,
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmi,
                    style: kResultNumberStyle,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,
                  ),
                  BottomButton(
                    buttonName: 'RE-CALCULATE',
                    onTap: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
