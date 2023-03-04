// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // this widget can be rebuilt due to

  @override
  State<StatefulWidget> createState() {
    // ignore: todo
    // TODO: implement createState
    return _MyAppState(); // new object
  }
}

// adding under score changes this class to private class, and now it can not be
// accessed from outside this file, this is good to avoid weired bugs

class _MyAppState extends State<MyApp> {
  // state can be persistant
  
  final _questions = const [
    //maps
    {
      'QuestionText': 'What\'s your favourite color?',
      'answers': [
        {'text':'Black', 'score':10}, 
        {'text':'Red', 'score':5}, 
        {'text':'Green', 'score':3}, 
        {'text':'White', 'score':1},
        ],
    },
    {
      'QuestionText': 'What\'s your favourite animal?',
      'answers': [
        {'text':'Rabbit', 'score':3}, 
        {'text':'Sanke', 'score':11}, 
        {'text':'Elephant', 'score':5}, 
        {'text':'Lion', 'score':9},
      ]
    },
    {
      'QuestionText': 'Who\'s your favourite instructor?',
      'answers': [
        {'text':'Max', 'score':1}, 
        {'text':'Max', 'score':1}, 
        {'text':'Max', 'score':1}, 
        {'text':'Max', 'score':1},
      ]
    }
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {

    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    });

    print(_questionIndex);

    if (_questionIndex < _questions.length) {
      print("We have more questions");
    } else {
      print('No more questions');
    }
  }

// const : is a compile time constsnt
// final : ia a run time constant

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}

// class MyApp extends StatelessWidget {

//   Widget build(BuildContext context){
//     return MaterialApp(home: Text('\nHello\nThis is Yogesh'),);
//   }

// }
