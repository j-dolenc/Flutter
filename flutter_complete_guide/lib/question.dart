import 'package:flutter/material.dart';

//class is marked as immutable but you can change questionText, so you should mark it as final
class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Text(questionText);
  }
}
