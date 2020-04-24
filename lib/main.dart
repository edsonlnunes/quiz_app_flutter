import 'package:flutter/material.dart';
import 'package:quiz_flutter/Quiz.dart';
import 'package:quiz_flutter/Result.dart';

main() => runApp(QuizApp());

class _QuizAppState extends State<QuizApp> {
  int _indexQuestion = 0;
  int _totalScore = 0;

  final _quiz = const [
    {
      'question': 'Qual é a sua cor favorita?',
      'answers': [
        {'text': 'Preto', 'score': 10},
        {'text': 'Vermelho', 'score': 7},
        {'text': 'Verde', 'score': 5},
        {'text': 'Brancoc', 'score': 3}
      ]
    },
    {
      'question': 'Qual é o seu animal favorito?',
      'answers': [
        {'text': 'Coelho', 'score': 10},
        {'text': 'Cobra', 'score': 7},
        {'text': 'Elefante', 'score': 5},
        {'text': 'Leão', 'score': 3}
      ]
    },
    {
      'question': 'Qual é o seu herói favorito?',
      'answers': [
        {'text': 'Homem de ferro', 'score': 10},
        {'text': 'Hulk', 'score': 7},
        {'text': 'Capitão américa', 'score': 5},
        {'text': 'Doutor Estranho', 'score': 3}
      ]
    }
  ];

  responder(int score) {
    if (this._thereIsQuestion) {
      setState(() {
        this._indexQuestion++;
        this._totalScore += score;
      });
    }
  }

  restartQuiz() {
    setState(() {
      _indexQuestion = 0;
      _totalScore = 0;
    });
  }

  bool get _thereIsQuestion {
    return _indexQuestion < _quiz.length;
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> answers =
        this._thereIsQuestion ? _quiz[_indexQuestion]['answers'] : null;

    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Quiz'),
              centerTitle: true,
            ),
            body: this._thereIsQuestion
                ? Quiz(
                    question: _quiz.elementAt(_indexQuestion)['question'],
                    answers: answers,
                    fn: responder,
                  )
                : Result(totalScore: this._totalScore, restart: restartQuiz)));
  }
}

class QuizApp extends StatefulWidget {
  _QuizAppState createState() {
    return _QuizAppState();
  }
}
