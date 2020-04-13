import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/card_content.dart';
import 'package:bmi_calculator/components/reuseable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/RoundIcon.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/calculator.dart';
import 'result_page.dart';

enum Gender { male, female }

class BmiCalculator extends StatefulWidget {
  @override
  _BmiCalculatorState createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  Gender selectedGender;
  int height = 180;
  int weight = 20;
  int age = 40;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(
                        () {
                          selectedGender = Gender.male;
                        },
                      );
                    },
                    cardChild: CardContent(
                        icon: Icon(Icons.add_shopping_cart, size: 80.0),
                        text: 'MALE'),
                    colour: selectedGender == Gender.male
                        ? cardColor
                        : inactiveCardColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(
                        () {
                          selectedGender = Gender.female;
                        },
                      );
                    },
                    cardChild: CardContent(
                        icon: Icon(Icons.airline_seat_flat, size: 80.0),
                        text: 'FEMALE'),
                    colour: selectedGender == Gender.female
                        ? cardColor
                        : inactiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: TextStyle(fontSize: 20),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberStyle,
                      ),
                      Text('cm', style: TextStyle(color: Colors.lime))
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                      overlayColor: Color(0x60EB1555),
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        divisions: 10,
                        min: 120,
                        max: 220,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        }),
                  )
                ],
              ),
              colour: cardColor,
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: cardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(weight.toString(), style: kNumberStyle),
                        Text(
                          'WEIGHT',
                          style: TextStyle(fontSize: 20),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                                icon: Icons.bubble_chart,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                            SizedBox(width: 12),
                            RoundIconButton(
                              icon: Icons.add,
                              onPressed: () {
                                setState(
                                  () {
                                    weight++;
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: cardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(age.toString(), style: kNumberStyle),
                        Text(
                          'AGE',
                          style: TextStyle(fontSize: 20),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                                icon: Icons.bubble_chart,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                }),
                            SizedBox(width: 12),
                            RoundIconButton(
                              icon: Icons.add,
                              onPressed: () {
                                setState(
                                  () {
                                    age++;
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            label: 'CALCULATE',
            onPressed: () {
              Calculator calc = Calculator(height: height, weight: weight);
              print(height);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(

                     bmiValue: calc.calculateBMI(),
                    bmiResult: calc.getResult(),
                   
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
