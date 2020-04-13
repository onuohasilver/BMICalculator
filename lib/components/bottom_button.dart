import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.label, @required this.onPressed});
  final String label;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          child: Text(label),
          color: bottomBarColor,
          margin: EdgeInsets.only(top: 10.0),
          height: bottomBarHeight,
          width: double.infinity),
    );
  }
}
