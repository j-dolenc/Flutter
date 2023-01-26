import "package:flutter/material.dart";
import "./textt.dart";
import "./textControl.dart";

class App extends StatelessWidget {
  final String bodyText;
  final Function changeText;

  App(this.bodyText, this.changeText);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Textt(bodyText),
      TextControl(changeText),
    ]);
  }
}
