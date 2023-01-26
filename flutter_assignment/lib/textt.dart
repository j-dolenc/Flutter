import 'package:flutter/material.dart';

class Textt extends StatelessWidget {
  final String bodyText;

  Textt(this.bodyText);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        bodyText,
        style: TextStyle(
          fontSize: 28,
        ),
        textAlign: TextAlign.center,
      ),
      alignment: Alignment.center,
      width: double.infinity, //takes as much width as it can get
      margin: EdgeInsets.all(10),
    );
  }
}
