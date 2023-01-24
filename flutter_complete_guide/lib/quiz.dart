import 'package:flutter/material.dart';
import './answer.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  final Function answerQuestion; //can also be VoidCallBack
  final List<Map<String, Object>> questions;
  final int qIndex;

  Quiz({
    @required this.answerQuestion,
    @required this.questions,
    @required this.qIndex,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[qIndex]["questiontext"] as String,
        ),
        ...(questions[qIndex]["answers"] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['text']);
        }).toList() //is .toList() actually needed?
      ],
    );
  }
}
