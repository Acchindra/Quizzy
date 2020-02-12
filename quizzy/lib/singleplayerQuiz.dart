import 'package:flutter/material.dart';
import 'package:quizzy/quizcard.dart';
import 'package:quizzy/createquestion.dart';

const bgcolor = Color(0xff456990);

bool showCreateNewQuizButton = true;
class SinglePlayerQuiz extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new SingleQuizState();
  }
}
class SingleQuizState extends State<SinglePlayerQuiz> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: bgcolor,
      body: ListView (
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          //quizPage(7, "try this question for starters", ["Mr. Xu needs to be more productive in life", "Mr. Yum time to help some people", "daaaaaaaaaaaaaaaaaaaang Genius Acchin", "PED TDM BDB CHUNKY CHUNG SKEWER"])
          quizCard('first quiz', 'second quiz'),
          quizCard('second quiz', 'trying random stuff'),
          quizCard('third quiz', 'trying random stuff'),
          quizCard('fourth quiz', 'trying random stuff'),
          quizCard('fifth quiz', 'trying random stuff'),
          quizCard('sixth quiz', 'trying random stuff'),
          quizCard('seventh quiz', 'trying random stuff'),
        ],

      ),
      //floatingActionButton:createNewQuizButton(context),
    );
  }
}

/*Widget createNewQuizButton(context) {
  if (showCreateNewQuizButton) {
    return new FloatingActionButton(
      heroTag: "createQuizButton",
      child: Text(
          "Create New Quiz",
          textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.green,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => new CreateQuestion()),
        );
      },
    );
  }

  else {
    return new Container();
  }
}*/