import 'package:flutter/material.dart';
import 'gamecom.dart';
import 'quizpage.dart';

const bgcolor = Color(0xff456990);

class MultiPlayerQuiz extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new MultiQuizState();
  }
}

class MultiQuizState extends State<MultiPlayerQuiz> {
  @override
  static final TextEditingController _name = new TextEditingController();
  String playerName;
  List<dynamic> lobbyList = <dynamic>[];

  @override
  void initState() {
    super.initState();
    ///
    /// Ask to be notified when messages related to the game
    /// are sent by the server
    ///
    game.addListener(_onGameDataReceived);
  }

  @override
  void dispose() {
    game.removeListener(_onGameDataReceived);
    super.dispose();
  }

  /// -------------------------------------------------------------------
  /// This routine handles all messages that are sent by the server.
  /// In this page, only the following 2 actions have to be processed
  ///  - players_list
  ///  - new_game
  /// -------------------------------------------------------------------
  _onGameDataReceived(message) {
    switch (message["action"]) {
    ///
    /// Each time a new player joins, we need to
    ///   * record the new list of players
    ///   * rebuild the list of all the players
    ///
      case "players_list":
        lobbyList = message["data"];

        // force rebuild
        setState(() {});
        break;

    ///
    /// When a game is launched by another player,
    /// we accept the new game and automatically redirect
    /// to the game board.
    /// As we are not the new game initiator, we will be
    /// using the "O"
    ///
      case 'next_question':
        Navigator.push(context, new MaterialPageRoute(
          builder: (BuildContext context)
          => new QuizPageState(
            opponentName: 'test',
            playerNum: 2
          ),
        ));
        break;
    }
  }

  /// -----------------------------------------------------------
  /// If the user has not yet joined, let the user enter
  /// his/her name and join the list of players
  /// -----------------------------------------------------------
  Widget _buildJoin() {
    if (game.playerName != "") {
      return new Container();
    }
    return new Container(
      padding: const EdgeInsets.all(16.0),
      child: new Column(
        children: <Widget>[
          new TextField(
            controller: _name,
            keyboardType: TextInputType.text,
            decoration: new InputDecoration(
              hintText: 'Enter your name',
              contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(32.0),
              ),
              icon: const Icon(Icons.person),
            ),
          ),
          new Padding(
            padding: const EdgeInsets.all(8.0),
            child: new RaisedButton(
              onPressed: _onGameJoin,
              child: new Text('Join...'),
            ),
          ),
        ],
      ),
    );
  }

  /// ------------------------------------------------------
  /// The user wants to join, so let's send his/her name
  /// As the user has a name, we may now show the other players
  /// ------------------------------------------------------
  _onGameJoin() {
    game.send('join', _name.text);

    /// Force a rebuild
    setState(() {});
  }

  /// ------------------------------------------------------
  /// Builds the list of players
  /// ------------------------------------------------------
  Widget _lobbyList() {
    ///
    /// If the user has not yet joined, do not display
    /// the list of players
    ///
    if (game.playerName == "") {
      return new Container();
    }

    ///
    /// Display the list of players.
    /// For each of them, put a Button that could be used
    /// to launch a new game
    ///
    List<Widget> children = lobbyList.map((playerInfo) {
      return new ListTile(
        title: new Text(playerInfo["name"]),
        trailing: new RaisedButton(
          onPressed: (){
            _onPlayGame(playerInfo["name"], playerInfo["id"]);
          },
          child: new Text('Play'),
        ),
      );
    }).toList();

    return new Column(
      children: children,
    );
  }

  /// --------------------------------------------------------------
  /// We launch a new Game, we need to:
  ///    * send the action "new_game", together with the ID
  ///      of the opponent we choosed
  ///    * redirect to the game board
  ///      As we are the game initiator, we will play with the "X"
  /// --------------------------------------------------------------
  _onPlayGame(String name, String id){
    // We need to send the opponentId to initiate a new game
    game.send('join_game', id);

    Navigator.push(context, new MaterialPageRoute(
      builder: (BuildContext context)
      => new QuizPageState(
        opponentName: name,
        playerNum: 1
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: bgcolor,
        body: SingleChildScrollView(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _buildJoin(),
              new Text('List of players:'),
              _lobbyList(),
            ],
          ),
        ),
      );
  }
}

//import 'package:flutter/material.dart';
//import 'package:quizzy/quizcard.dart';
//
//const bgcolor = Color(0xff456990);
//
//class MultiPlayerQuiz extends StatefulWidget{
//  @override
//  State<StatefulWidget> createState() {
//    return new MultiQuizState();
//  }
//}
//class MultiQuizState extends State<MultiPlayerQuiz> {
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      backgroundColor: bgcolor,
//      body: ListView (
//        padding: EdgeInsets.all(10.0),
//        children: <Widget>[
//          //quizPage(7, "try this question for starters", ["Mr. Xu needs to be more productive in life", "Mr. Yum time to help some people", "daaaaaaaaaaaaaaaaaaaang Genius Acchin", "PED TDM BDB CHUNKY CHUNG SKEWER"])
//          quizCard('first quiz', 'second quiz'),
//          quizCard('second quiz', 'trying random stuff'),
//          quizCard('third quiz', 'trying random stuff'),
//          quizCard('fourth quiz', 'trying random stuff'),
//          quizCard('fifth quiz', 'trying random stuff'),
//          quizCard('sixth quiz', 'trying random stuff'),
//          quizCard('seventh quiz', 'trying random stuff')
//        ],
//      ),
//    );
//  }
//}