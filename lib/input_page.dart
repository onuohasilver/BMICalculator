import 'package:flutter/material.dart';
import 'card_content.dart';
import 'reuseable_card.dart';

const double bottomBarHeight = 80.0;
const bottomBarColor = Color(0xFFEB1555);
const cardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);

enum Gender { male, female }

class BmiCalculator extends StatefulWidget {
  @override
  _BmiCalculatorState createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(
                        () {
                          selectedGender=Gender.male;
                        },
                      );
                    },
                    child: ReusableCard(
                      cardChild: CardContent(
                          icon: Icon(Icons.add_shopping_cart, size: 80.0),
                          text: 'MALE'),
                      colour: selectedGender==Gender.male?cardColor:inactiveCardColor,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(
                        () {
                          selectedGender=Gender.female;
                        },
                      );
                    },
                    child: ReusableCard(
                      cardChild: CardContent(
                          icon: Icon(Icons.airline_seat_flat, size: 80.0),
                          text: 'FEMALE'),
                      colour: selectedGender==Gender.female?cardColor:inactiveCardColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: cardColor,
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: cardColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: cardColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
              color: bottomBarColor,
              margin: EdgeInsets.only(top: 10.0),
              height: bottomBarHeight,
              width: double.infinity),
        ],
      ),
    );
  }
}
