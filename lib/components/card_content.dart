import 'package:flutter/material.dart';
class CardContent extends StatelessWidget {
  final Icon icon;
  final String text;
  CardContent({@required this.icon,@required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        icon,
        SizedBox(height: 14),
        Text(
          text,
          style: TextStyle(fontSize: 20),
        )
      ],
    );
  }
}
