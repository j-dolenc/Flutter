import 'package:flutter/material.dart';

//class is marked as immutable but you can change questionText, so you should mark it as final
class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        questionText,
        style: TextStyle(
          fontSize: 28,
        ),
        textAlign:
            TextAlign.center, //it will be centered inside its container...
      ),
      width: double.infinity, //takes as much width as it can get
      margin: EdgeInsets.all(10),
    );
  }
}
