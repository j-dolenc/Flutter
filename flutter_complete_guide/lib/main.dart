import 'package:flutter/material.dart';

import './answer.dart';
import './question.dart';

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
  var _qIndex = 0;
  //MyApp({this.text});
  void _answerQuestion() {
    if (_qIndex < 4) {
      setState(() {
        _qIndex += 1;
      });
    }
  }

  //this class can now be used as a widget
  //each widget needs a build method with context argument
  @override //technically it is not required, it is a decorator and is provided by Flutter, it is common practice to write it so the code is more readable.
  Widget build(BuildContext context) {
    var questions = [
      {
        "questiontext": "What is your favorite hobby?",
        "answers": ["Sports", "Music", "Studying", "Dying"]
      },
      {
        "questiontext": "What is your favorite book?",
        "answers": ["kekec", "Bela Smrt", " Peter Klepec", "Janez in Petra"]
      },
      {
        "questiontext": "What is your favorite movie?",
        "answers": ["Peter Klepec", "Kekec 1", "Kekec 2", "Kekec 3"]
      },
      {
        "questiontext": "What is your favorite food?",
        "answers": ["Lasagna", "Pizza", "Salad"]
      },
      {
        "questiontext": "What is your favorite place you have ever visited?",
        "answers": ["Home", "School", "Hell", "Heaven", "Your mom"]
      },
    ];
    //home: the widget for the default route of the app "/"
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("My First App"),
          ),
          body: Column(
            children: [
              Question(questions[_qIndex]["questiontext"] as String),
              ...(questions[_qIndex]["answers"] as List<String>).map((answer) {
                return Answer(_answerQuestion, answer);
              })
            ],
          )),
    );
  }
}
