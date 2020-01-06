import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_app/Components/ReusableWidget.dart';
import 'package:bmi_app/Components/GenderWidget.dart';
import 'package:bmi_app/constants.dart';
import 'BmiResult.dart';
import 'package:bmi_app/Components/bottom_button.dart';
import 'package:bmi_app/Components/round_icon.dart';
import 'package:bmi_app/BmiCalculation.dart';

enum Gender {
  male,
  female,
  others,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color malewidgetcolor = kInactivecolour;
  Color femalewigetcolor = kInactivecolour;
  Color otherwidgetcolor = kInactivecolour;

  Gender selectedGender;
  int height = 161;
  int weight = 69;
  int age = 23;

  String bmi;
  String result;
  String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableWidget(
                    onpress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kActivecolour
                        : kInactivecolour,
                    cardWidget: GenderWidget(
                        iconWidget: FontAwesomeIcons.mars, Gender: 'Male'),
                  ),
                ),
                Expanded(
                  child: ReusableWidget(
                    onpress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kActivecolour
                        : kInactivecolour,
                    cardWidget: GenderWidget(
                      iconWidget: FontAwesomeIcons.venus,
                      Gender: 'Female',
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ReusableWidget(
              colour: kActivecolour,
              cardWidget: Column(
                children: <Widget>[
                  Text(
                    'Height',
                    style: kLabelTextSytle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextSytle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 20),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                      min: 120,
                      max: 240,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableWidget(
                    colour: kActivecolour,
                    cardWidget: Column(
                      children: <Widget>[
                        Text(
                          'Weight',
                          style: kLabelTextSytle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                                RoundButton: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                }),
                            SizedBox(
                              width: 15.0,
                            ),
                            RoundIconButton(
                                RoundButton: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableWidget(
                    colour: kActivecolour,
                    cardWidget: Column(
                      children: <Widget>[
                        Text(
                          'Age',
                          style: kLabelTextSytle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                                RoundButton: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                }),
                            SizedBox(
                              width: 15.0,
                            ),
                            RoundIconButton(
                                RoundButton: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                }),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          BottomButton(
              buttonName: 'Calculate',
              onTap: () {
                CalculatorBrain val =
                    CalculatorBrain(height: height, weight: weight);

                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Result(
                    bmi: val.CalculateBmi(),
                    interpretation: val.getInterpretation(),
                    res: val.getResult(),
                  );
                }));
              })
        ],
      ),
    );
  }
}
