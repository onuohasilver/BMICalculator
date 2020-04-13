import 'package:flutter/material.dart';
import 'package:bmi_calculator/screens/input_page.dart';
import 'package:bmi_calculator/screens/result_page.dart';

void main() {
  runApp(
    MaterialApp(
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: Color(0xFF0A0E21),
            primaryColor: Color(0xFF0A0E21),
            textTheme: TextTheme(
              body1: TextStyle(color: Colors.white),
            )),
        initialRoute: '/',
        routes:{
          '/':(context)=>BmiCalculator(),
          'result':(context)=>ResultPage(),

        }
        ),
        
  );
}
