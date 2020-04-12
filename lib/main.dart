import 'package:flutter/material.dart';
import 'input_page.dart';

void main() {
  runApp(
    MaterialApp(
        theme: ThemeData.dark().copyWith(
            primaryColor: Color(0xFF0A0E21),
            textTheme: TextTheme(
              body1: TextStyle(color: Colors.white),
            )),
        home: BmiCalculator()),
  );
}
