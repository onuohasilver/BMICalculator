import 'dart:math';

class Calculator{
  Calculator({this.height, this.weight});
  final int height;
  final int weight;

  double _bmi;
  

  String calculateBMI(){
    _bmi=weight/pow(height,2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if (_bmi>=25){
      return 'Overweight';
    }else if(_bmi>18.5){
      return 'Quite Normal';
    }else{
      return 'You should eat something';
    }
  }

   String getInterpretation(){
    if (_bmi>=25){
      return 'You are doing well in this something, you are doing in the thing that doesn\'t make sense';
    }else if(_bmi>18.5){
      return 'Normal human being like you, you are doing good eh';
    }else{
      return 'You should eat something, if you don\'t watch yourself you will soon turn to a broom o';
    }
  }

}