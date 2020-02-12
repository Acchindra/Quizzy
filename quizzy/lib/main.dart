import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:quizzy/createquestion.dart';
import 'package:quizzy/multiplayerQuiz.dart';
import 'package:quizzy/singleplayerQuiz.dart';
const appbarColor = Color(0xffEF767A);

void main() {
  runApp(
    new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "QuizGame",
      home: FrontPage(),
    ),
  );


}

bool showCreateNewQuizButton;
int index = 0;
List<Widget> _children = [
  new SinglePlayerQuiz(),
  new SinglePlayerQuiz(),
  new MultiPlayerQuiz(),
];
class FrontPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return new _FrontPage();
  }
}class _FrontPage extends State<FrontPage> with TickerProviderStateMixin {
  TabController _tabController;

  @override
  Widget build(BuildContext context) {
    _tabController = new TabController(vsync: this, length: 2);
    /*_tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        FocusScope.of(context).requestFocus(new FocusNode());
      }
    });*/
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Quizzy", style: GoogleFonts.bungee()),
        backgroundColor: appbarColor,
        centerTitle: true,
      ),
      body: _children[index],
      bottomNavigationBar: BottomAppBar(
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(
                icon: new Icon(Icons.person),
                title: new Text('SinglePlayer')
            ),

            new BottomNavigationBarItem(
                icon: new Icon(Icons.group),
                title: new Text('MultiPlayer')
            ),

          ],
          currentIndex: index,
          onTap: (int i) {
            setState(() {
              index = i;
            });
          },
          backgroundColor: Colors.red,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
        ),
        shape:CircularNotchedRectangle(),
        color: Colors.red,
        clipBehavior: Clip.antiAlias,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}


/*bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              new BottomNavigationBarItem(
                icon: new Icon(Icons.add),
                title: new Text('Create New Quiz')
              ),
              new BottomNavigationBarItem(
                icon: new Icon(Icons.person),
                title: new Text('SinglePlayer')
              ),
              new BottomNavigationBarItem(
                icon: new Icon(Icons.group),
                title: new Text('MultiPlayer')
              ),

            ],
            currentIndex: index,
            onTap: (int i) {
              setState(() {
                index = i;
              });
            },
            backgroundColor: Colors.red,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.white,
          ),*/


