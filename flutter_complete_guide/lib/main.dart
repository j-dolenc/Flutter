import 'package:flutter/material.dart';

import './quiz.dart';
import './answer.dart';
import './question.dart';
import './result.dart';
// void main() {
//   runApp(MyApp(text: "test"));
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

//_ is special syntax in dart, it turns a class into a private class
class _MyAppState extends State<MyApp> {
  //MyApp({@required String text}) {
  //you dont need this body
  //  this.text = text;
  //}

  final _questions = const [
    //you can add const before the value as well
    //to make it really clear this is compile time constant and runtime constant. Final is only runtime constant.
    {
      "questiontext": "What is your favorite hobby?",
      "answers": [
        {'text': "Sports", "score": 3},
        {'text': "Music", "score": 5},
        {'text': "Studying", "score": 8},
        {'text': "Dying", "score": 10},
      ]
    },
    {
      "questiontext": "What is your favorite book?",
      "answers": [
        {'text': "Kekec", "score": 2},
        {'text': "Bela Smrt", "score": 8},
        {'text': " Peter Klepec", "score": 5},
        {'text': "Janez in Petra", "score": 10},
      ]
    },
    {
      "questiontext": "What is your favorite movie?",
      "answers": [
        {'text': "Peter Klepec", "score": 1},
        {'text': "Kekec 1", "score": 3},
        {'text': "Kekec 2", "score": 6},
        {'text': "Kekec 3", "score": 9},
      ]
    },
    {
      "questiontext": "What is your favorite food?",
      "answers": [
        {'text': "Lasagna", "score": 1},
        {'text': "Pizza", "score": 5},
        {'text': "Salad", "score": 10},
      ]
    },
    {
      "questiontext": "What is your favorite place you have ever visited?",
      "answers": [
        {'text': "Home", "score": 4},
        {'text': "School", "score": 6},
        {'text': "Hell", "score": 10},
        {'text': "Heaven", "score": 8},
        {'text': "Your mom", "score": 1},
      ]
    },
  ];

  var _qIndex = 0;
  var _totalScore = 0;
  //MyApp({this.text});
  void _answerQuestion(int score) {
    //Boolean? statement = _qIndex < questions.length; //this also works
    //statement = null; //with the ? you can set it to null, it is either its value type or null.
    if (_qIndex < _questions.length) {
      setState(() {
        _qIndex += 1;
      });
      _totalScore += score;
    }
  }

  //this class can now be used as a widget
  //each widget needs a build method with context argument
  @override //technically it is not required, it is a decorator and is provided by Flutter, it is common practice to write it so the code is more readable.
  Widget build(BuildContext context) {
    //var dummy = const ['Hey'];
    //dummy.add("Jurij");
    //print(dummy); //you ojnly get an error after compiling your code

    //home: the widget for the default route of the app "/"
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body: _qIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                qIndex: _qIndex,
              )
            : Result(_totalScore),
      ),
    );
  }
}
