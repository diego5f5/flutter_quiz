import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9},
      ],
    },
    {
      'questionText': 'Do you like this quiz?',
      'answers': [
        {'text': 'Yes', 'score': 1},
        {'text': 'Yes', 'score': 1},
        {'text': 'Yes', 'score': 1},
        {'text': 'Yes', 'score': 1},
      ],
    },
  ];

  int _questionIndex = 0;
  num _totalScore = 0;

  void _handleAnswerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex += 1;
    });
  }

  void _handleResetQuestions() {
    _totalScore = 0;

    setState(() {
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                handleAnswerQuestion: _handleAnswerQuestion,
              )
            : Result(
                handleResetQuestions: _handleResetQuestions,
                totalScore: _totalScore,
              ),
      ),
    );
  }
}
