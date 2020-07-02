import 'package:flutter/material.dart';
import 'package:learnflutter/result.dart';
import './quiz.dart';
import './result.dart';
import './question.dart';
import './answer.dart';

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
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 5}
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 5},
        {'text': 'Snake', 'score': 3},
        {'text': 'Elephant', 'score': 7},
        {'text': 'Lion', 'score': 10}
      ],
    },
    {
      'questionText': 'What\'s your favorite instructor?',
      'answers': [ {'text': 'max', 'score': 1},
        {'text': 'max', 'score': 1},
        {'text': 'max', 'score': 1},
        {'text': 'max', 'score': 1}],
    }
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz(){
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {

    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more question!');
    } else {
      print('No more question!');
    }
  }

  @override
  Widget build(BuildContext context) {
//    questions = []; this cannot work if question is a const
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hai'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore,_resetQuiz),
      ),
    );
  }
}
