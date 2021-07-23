import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

// void main() {
//   runApp(MyApp());
// } still more comming 
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'what\'s your favorite color?',
      'answers': [
        {'text': 'black', 'score': 10},
        {'text': 'red', 'score': 8},
        {'text': 'green', 'score': 5},
        {'text': 'white', 'score': 5}
      ],
    },
    {
      'questionText': 'what\'s your favorite anilmal?',
      'answers': [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'snake', 'score': 8},
        {'text': 'Elephent', 'score': 5},
        {'text': 'Lion', 'score': 5},
      ]
    },
    {
      'questionText': 'what\'s your favorite instructor?',
      'answers': [
        {'text': 'max', 'score': 10},
        {'text': 'Tom', 'score': 8},
        {'text': 'edy', 'score': 5},
        {'text': 'alex', 'score': 5},
      ],
    }
  ];

  var _totalScore = 0;
  var _questionIndex = 0;

  void _resetQuiz() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('we have more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text("My First app"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
