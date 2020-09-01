import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'quizBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain qb=QuizBrain();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[800],
        appBar: AppBar(
          title: Text('Quiz App'),
          centerTitle: true,
          backgroundColor: Colors.black45,
        ),
        body:SafeArea(
          child:Padding(
            padding: EdgeInsets.all(10.0),
            child: quiz(),
          ),
        ) ,
      ),
    );
  }
}

class quiz extends StatefulWidget {
  @override
  _quizState createState() => _quizState();
}

class _quizState extends State<quiz> {

  List<Icon> score=[];

  void bottomicon(bool answer) {
    var t = qb.getans();

    setState(() {
      if(qb.isFinished()==true){
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();

        qb.reset();
        score=[];
      }
      else {
        if (t == answer) {
          score.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        }
        else {
          score.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        qb.nextques();
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Text(
            qb.getques(),
            style: TextStyle(
              fontSize: 35.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: RaisedButton(
            color: Colors.green[600],
            child:Text(
              'True',
              style: TextStyle(
                fontSize: 25.0,
              ),
            ),
            onPressed: (){
              bottomicon(true);
            },
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Expanded(
          flex: 1,
          child: RaisedButton(
            color: Colors.redAccent,
            child:Text(
              'False',
              style: TextStyle(
                fontSize: 25.0,
              ),
            ),
            onPressed: (){
              bottomicon(false);
            },
          ),
        ),
        Expanded(
          child: Row(
            children: score,
          ),
        ),

      ],
    );
  }
}
