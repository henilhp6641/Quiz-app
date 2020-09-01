import 'dart:io';

import 'question.dart';

class QuizBrain{
  int _no=0;

  List<question> _questionBank=[question(ques: 'Our PM is Modi',ans: true),
    question(ques:'India Capital is Gujarat',ans: false),
    question(ques:'Corona Second Name is Covid-19',ans: true),
    question(ques:'India second name is bharat',ans: true),
    question(ques:'Canada is worst country for study',ans: false),
    question(ques:'India army is better then Canada army',ans: true),
    question(ques:'India 2nd best clean city is Mumbai',ans: false),
    question(ques:'India launch new rocket in 2020',ans: true),
    question(ques:'Mark zukarburg is founder of Facebook',ans: true),
    question(ques:'Mukesh Ambani is founder of Apple',ans: false)];

  void nextques(){
    if(_no<_questionBank.length-1) {
      _no++;
    }
  }

  String getques(){
    return _questionBank[_no].ques;
  }

  bool getans(){
    return _questionBank[_no].ans;
  }

  bool isFinished() {
    if (_no >= _questionBank.length - 1) {
      print('Now returning true');
      return true;

    } else {
      return false;
    }
  }

  void reset() {
    _no = 0;
  }
}