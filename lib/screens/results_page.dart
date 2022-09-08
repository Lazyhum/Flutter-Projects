import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/main.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/icon_widget.dart';
import 'package:bmi_calculator/components/my_card.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';

class ResultsPage extends StatelessWidget {
  //const ResultsPage({Key? key}) : super(key: key);

  ResultsPage(
      {required this.bmiResults,
      required this.resultT,
      required this.interpretation});

  final String bmiResults;
  final String resultT;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(resultT, style: kMainTextBody),
              ),
            ),
            Expanded(
              flex: 5,
              child: MyCard(
                colour: kInactiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultT.toUpperCase(),
                      style: kResultText,
                    ),
                    Text(
                      bmiResults.toString(),
                      style: kResultBMI,
                    ),
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: kBodyText,
                    ),
                  ],
                ),
              ),
            ),
            BottomButton(
              onTap: () {
                Navigator.pop(context, MaterialPageRoute(builder: (context) {
                  return InputPage();
                }));
              },
              buttonText: 'RE-CALCULATE',
            )
          ],
        ));
  }
}
