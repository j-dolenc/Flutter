import "package:flutter/material.dart";

class TextControl extends StatelessWidget {
  final Function changeText;

  TextControl(this.changeText);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () => changeText("Changed Text"),
        child: Text("Change Text"),
      ),
    );
  }
}
