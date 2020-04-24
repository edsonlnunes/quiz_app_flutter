import 'package:flutter/material.dart';

import 'Answer.dart';
import 'Question.dart';

class Quiz extends StatelessWidget {
  final String question;
  final List<Map<String, Object>> answers;
  final void Function(int) fn;

  Quiz({
    @required this.question,
    @required this.answers,
    @required this.fn,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(question),
        ...answers.map((answer) => Answer(
              text: answer['text'],
              fnPressed: () => this.fn(answer['score']),
            ))
      ],
    );
  }
}
