import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;

  Result(this.resultScore);

  //Getter
  String get resultPhrase {
    var resultText = "You did it!";
    if (resultScore <= 10) {
      resultText = "You are awesome and innocent";
    } else if (resultScore <= 13) {
      resultText = "You are pretty likeable";
    } else if (resultScore <= 18) {
      resultText = "You are WEIRD!";
    } else {
      resultText = "NO ONE LIKES YOU";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        resultPhrase,
        style: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
