import 'package:flutter/material.dart';

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
  void answerQuestion() {
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
      "What is your favorite hobby?",
      "What is your favorite book?",
      "What is your favorite movie?",
      "What is your favorite food?",
      "What is your favorite place you have ever visited?"
    ];
    //home: the widget for the default route of the app "/"
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("My First App"),
          ),
          body: Column(
            children: [
              Question(questions[_qIndex]),
              ElevatedButton(
                child: Text("Answer 1"),
                onPressed: answerQuestion,
              ),
              ElevatedButton(
                child: Text("Answer 2"),
                onPressed: answerQuestion,
              ),
              ElevatedButton(
                child: Text("Answer 3"),
                onPressed: answerQuestion,
              ),
              ElevatedButton(
                child: Text("Answer 4"),
                onPressed: answerQuestion,
              ),
              ElevatedButton(
                child: Text("Answer 5"),
                onPressed: answerQuestion,
              ),
            ],
          )),
    );
  }
}
