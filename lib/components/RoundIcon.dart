import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';


class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  RoundIconButton({this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 16.0,
      constraints: BoxConstraints.tightFor(height: 60, width: 50),
      child: Icon(icon),
      fillColor: Color(0xFF4C4F5E),
      shape: CircleBorder(),
    );
  }
}
