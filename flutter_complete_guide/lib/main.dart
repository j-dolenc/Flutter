import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp(text: "test"));
// }

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //MyApp({@required String text}) {
  //you dont need this body
  //  this.text = text;
  //}

  //MyApp({this.text});

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
              Text("The question!"),
              ElevatedButton(
                child: Text("Answer 1"),
                onPressed: null,
              ),
              ElevatedButton(
                child: Text("Answer 1"),
                onPressed: null,
              ),
              ElevatedButton(
                child: Text("Answer 1"),
                onPressed: null,
              ),
              ElevatedButton(
                child: Text("Answer 1"),
                onPressed: null,
              ),
              ElevatedButton(
                child: Text("Answer 1"),
                onPressed: null,
              ),
            ],
          )),
    );
  }
}
