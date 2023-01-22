import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  //const Answer({Key key}) : super(key: key);
  final Function selectHandler;
  //the type can also be VoidCallback, it is a more specific type of the type Function
  //if it doesn't return anything you should use VoidCallBack
  final String answerText;
  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(Color.fromARGB(255, 53, 134, 196)),
            foregroundColor:
                MaterialStateProperty.all(Color.fromARGB(255, 255, 255, 255))),
        child: Text(answerText),
        onPressed: selectHandler,
      ),
    );
  }
}
