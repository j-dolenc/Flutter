// 1) Create a new Flutter App (in this project) and output an AppBar and some text
// below it
// 2) Add a button which changes the text (to any other text of your choice)
// 3) Split the app into three widgets: App, TextControl & Text
import 'package:flutter/material.dart';
import './app.dart';

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
  var _bodyText = "Something random";

  void _changeText(String newText) {
    setState(() {
      _bodyText = newText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("AAAAA"),
        ),
        body: App(_bodyText, _changeText),
      ),
    );
  }
}
