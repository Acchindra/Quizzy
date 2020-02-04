import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'gamecom.dart';

const cardcolor = Color(0xff49BEAA);
const buttoncolor = Color(0xffEEB868);
const appbarColor = Color(0xffEF767A);
const bgcolor = Color(0xff456990);

class QuizPageState extends StatefulWidget {
  QuizPageState({
    Key key,
    this.opponentName,
    this.playerNum,
  }): super(key: key);

  final String opponentName;
  final int playerNum;

  String question;
  int number;
  List answers;

  @override
  QuizPage createState() => QuizPage();
}

class QuizPage extends State<QuizPageState> {
  @override
  void initState(){
    super.initState();
    ///
    /// Ask to be notified when a message from the server
    /// comes in.
    ///
    game.addListener(_onAction);
  }

  @override
  void dispose(){
    game.removeListener(_onAction);
    super.dispose();
  }

  /// ---------------------------------------------------------
  /// The opponent took an action
  /// Handler of these actions
  /// ---------------------------------------------------------
  _onAction(message){
    switch(message["action"]){
    ///
    /// The opponent resigned, so let's leave this screen
    ///
      case 'resigned':
        Navigator.of(context).pop();
        break;

    ///
    /// The opponent played a move.
    /// So record it and rebuild the board
    ///
      case 'play':
        var data = (message["data"] as String).split(';');
        //grid[int.parse(data[0])] = data[1];

        // Force rebuild
        setState((){});
        break;

      case 'next_question':
        widget.answers = message["data"]["answer_choices"];
        widget.number = message["data"]["question_number"];
        widget.question = message["data"]["question_text"];

        setState(() {});
        break;
    }
  }

  /// ---------------------------------------------------------
  /// This player resigns
  /// We need to send this notification to the other player
  /// Then, leave this screen
  /// ---------------------------------------------------------
  _doResign(){
    game.send('resign', '');
    Navigator.of(context).pop();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
        appBar: new AppBar(
          title: new Text("Quizzy", style: GoogleFonts.bungee()),
          backgroundColor: appbarColor,
          centerTitle: true,
        ),
        body: Column(
            children: <Widget>[
              SizedBox(height: 20),
              questionCard(5, 'wtf is this'),
              SizedBox(height: 20),
              answerCard(['a', 'b', 'c', 'd'])
            ]
        )
    );
  }

  Widget questionCard(int number, String question) {
    return Card(
      color: cardcolor,
      elevation: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Column(
        children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.all(20),
            leading: Icon(Icons.question_answer),
            title: Text("Question $number", style: GoogleFonts.bungee(fontSize: 30, textStyle: TextStyle(color: Colors.white, decoration: TextDecoration.underline))),
            subtitle: Text(question, style: GoogleFonts.bungee(fontSize: 20, textStyle: TextStyle(color: Colors.white))),
          ),
        ],
      ),
    );
  }

  Widget answerCard(List answers) {
    return Card(
        color: cardcolor,
        elevation: 20,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child: FlatButton(
                  padding: EdgeInsets.all(20.0),
                  child: Text(answers[0], style: GoogleFonts.bungee(fontSize: 20, textStyle: TextStyle(color: Colors.white))),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  color: buttoncolor,
                  onPressed: () {
                    //game.send('select_answer', answers[0]);
                    setState((){});
                  },
                ),
              ),
              Padding (
                padding: EdgeInsets.all(20.0),
                child: FlatButton(
                  padding: EdgeInsets.all(20.0),
                  child: Text(answers[1], style: GoogleFonts.bungee(fontSize: 20, textStyle: TextStyle(color: Colors.white))),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  color: buttoncolor,
                  onPressed: () {
                    //game.send('select_answer', answers[1]);
                    setState((){});
                  },
                ),
              ),
              Padding (
                padding: EdgeInsets.all(20.0),
                child: FlatButton(
                  padding: EdgeInsets.all(20.0),
                  child: Text(answers[2], style: GoogleFonts.bungee(fontSize: 20, textStyle: TextStyle(color: Colors.white))),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  color: buttoncolor,
                  onPressed: () {
                    //game.send('select_answer', answers[2]);
                    setState((){});
                  },
                ),
              ),
              Padding (
                padding: EdgeInsets.all(20.0),
                child: FlatButton(
                  padding: EdgeInsets.all(20.0),
                  child: Text(answers[3], style: GoogleFonts.bungee(fontSize: 20, textStyle: TextStyle(color: Colors.white))),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  color: buttoncolor,
                  onPressed: () {
                    //game.send('select_answer', answers[3]);
                    setState((){});
                  },
                ),
              )
            ]
        )
    );
  }
}

