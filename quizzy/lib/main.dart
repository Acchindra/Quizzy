import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:quizzy/multiplayerQuiz.dart';
import 'package:quizzy/singleplayerQuiz.dart';
const appbarColor = Color(0xffEF767A);

void main() {
  runApp(
    new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "QuizGame",
      home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: new AppBar(
              bottom: new TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.person)),
                  Tab(icon: Icon(Icons.group))
                ]
              ),
              title: new Text("Quizzy", style: GoogleFonts.bungee()),
              backgroundColor: appbarColor,
              centerTitle: true,
            ),
            body: TabBarView(
              children: [
                new SinglePlayerQuiz(),
                new MultiPlayerQuiz()
              ]
            ),
          )
      ),
    ),
  );
}


