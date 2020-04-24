import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String text;
  final void Function() fnPressed;

  Answer({this.text, this.fnPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 10, right: 10),
      child: RaisedButton(
        child: Text(text),
        onPressed: this.fnPressed,
        color: Colors.blue,
        textColor: Colors.white,
      ),
    );
  }
}
