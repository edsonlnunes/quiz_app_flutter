import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final void Function() restart;

  Result({this.totalScore, this.restart});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            'Parabéns, sua nota foi $totalScore',
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
        ),
        FlatButton(
          child: Text(
            'Reiniciar?',
            style: TextStyle(fontSize: 18),
          ),
          textColor: Colors.blue,
          onPressed: this.restart,
        )
      ],
    );
  }
}
