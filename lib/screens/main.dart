import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/icon_widget.dart';
import 'package:bmi_calculator/components/my_card.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'results_page.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender {
  male,
  female,
}

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF0B1034),
        appBarTheme: kAppTheme,
      ),
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 16;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF151A3C),
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyCard(
                    onPress: () {
                      setState(() {
                        print('male');
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconWidget(
                      icon: FontAwesomeIcons.mars,
                      label: 'Male',
                    ),
                  ),
                ),
                Expanded(
                  child: MyCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                        print('female');
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconWidget(
                      icon: FontAwesomeIcons.venus,
                      label: 'Female',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyCard(
              colour: Color(kInactiveCardColor.value),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Height', style: kLabelText),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: kNumberText),
                      Text('cm', style: kLabelText),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: kBottomContainerColor,
                      activeTrackColor: Color(0xFFc3c7e0),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayColor: Color(0x29EB1555),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220,
                      //activeColor: Color(0xFFEB1555),
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyCard(
                    colour: Color(kInactiveCardColor.value),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Weight', style: kLabelText),
                        Text(weight.toString(), style: kNumberText),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressF: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            RoundedIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressF: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: MyCard(
                    colour: Color(kInactiveCardColor.value),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Age', style: kLabelText),
                        Text(age.toString(), style: kNumberText),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressF: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            RoundedIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressF: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonText: 'CALCULATE',
            onTap: () {
              CalculatorBrain cal =
                  CalculatorBrain(height: height, weight: weight);

              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ResultsPage(
                  bmiResults: cal.calculateBMI(),
                  resultT: cal.getResultText(),
                  interpretation: cal.getInterpretation(),
                ),
              ));
            },
          ),
        ],
      ),
    );
  }
}

// Color maleCardColor = inactiveCardColor;
// Color femaleCardColor = inactiveCardColor;
//
// void updateColor(Gender selectedGender) {
//   if (selectedGender == Gender.male) {
//     if (maleCardColor == inactiveCardColor) {
//       maleCardColor = activeCardColor;
//       femaleCardColor = inactiveCardColor;
//     } else {
//       maleCardColor = inactiveCardColor;
//     }
//   } else {
//     if (femaleCardColor == inactiveCardColor) {
//       femaleCardColor = activeCardColor;
//       maleCardColor = inactiveCardColor;
//     } else {
//       femaleCardColor = inactiveCardColor;
//     }
//   }
// }
