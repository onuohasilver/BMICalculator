import 'package:bmi_calculator/components/reuseable_card.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class ResultPage extends StatelessWidget {
  ResultPage({@required this.bmiResult,@required this.bmiValue,@required this.interpretation});
  final String bmiResult;
  final String interpretation;
  final String bmiValue;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Text('YOUR RESULT', style: kTitleStyle),
              padding: EdgeInsets.all(14),
              alignment: Alignment.bottomCenter,
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: cardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(bmiResult, style: kMiniTitleStyle),
                  Text(bmiValue, style: kNumberStyleL),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: BottomButton(
              label: 'RE-CALCULATE',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
