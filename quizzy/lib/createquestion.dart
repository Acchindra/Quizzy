import 'package:flutter/material.dart';
import 'gamecom.dart';
import 'quizpage.dart';
import 'package:google_fonts/google_fonts.dart';

const bgcolor = Color(0xff456990);
const cardcolor = Color(0xff49BEAA);

class CreateQuestion extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new CreateQuestionState();
  }
}

class CreateQuestionState extends State<CreateQuestion> {
  @override
  static final TextEditingController _name = new TextEditingController();
  String playerName;
  List<dynamic> lobbyList = <dynamic>[];


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: bgcolor,
      body: ListView(
          children: <Widget>[
            SizedBox(height: 20),
            createQuestionCard(),
            SizedBox(height: 20),
            createAnswersCard()
          ],
        ),
      );
  }

  Widget createQuestionCard() {
    return Card(
      color: cardcolor,
      elevation: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Enter question'
            )
          )
        ],
      ),
    );
  }

  Widget createAnswersCard() {
    return Card (
      color: cardcolor,
      elevation: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Enter answer choice'
            )
          ),
          TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter answer choice'
              )
          ),
          TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter answer choice'
              )
          ),
          TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter answer choice'
              )
          )
        ],
      )
    );
  }
}
