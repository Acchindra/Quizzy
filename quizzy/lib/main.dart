import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:quizzy/quizcard.dart';
import 'package:quizzy/quizpage.dart';

void main() {
  runApp(
    new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Quizzy",
      home: new Quiz(),
    ),
  );
}

class Quiz extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new QuizState();
  }
}
class QuizState extends State<Quiz> {
  var appbarColor = Color(0xffEF767A);
  var bgcolor = Color(0xff456990);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: bgcolor,
      appBar: new AppBar(
        title: new Text("Quizzy", style: GoogleFonts.bungee()),
        backgroundColor: appbarColor,
        centerTitle: true,
      ),
      body: ListView (
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          quizPage(7, "try this question for starters", ["Mr. Xu needs to be more productive in life", "Mr. Yum time to help some people", "daaaaaaaaaaaaaaaaaaaang Genius Acchin", "PED TDM BDB CHUNKY CHUNG SKEWER"])
//          quizCard('first quiz', 'second quiz'),
//          quizCard('second quiz', 'trying random stuff'),
//          quizCard('third quiz', 'trying random stuff'),
//          quizCard('fourth quiz', 'trying random stuff'),
//          quizCard('fifth quiz', 'trying random stuff'),
//          quizCard('sixth quiz', 'trying random stuff'),
//          quizCard('seventh quiz', 'trying random stuff')
        ],
      ),
    );
  }
}