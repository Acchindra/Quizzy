import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizzy/quizpage.dart';
import 'package:quizzy/main.dart';

const cardcolor = Color(0xff49BEAA);
const buttoncolor = Color(0xffEEB868);

Widget quizPage(int number, String question, List answers){
  return Center(
    child: Column(
      children: <Widget>[
        SizedBox(height: 20),
        questionCard(number, question),
        SizedBox(height: 20),
        answerCard(answers)
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
            onPressed: () {},
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
            onPressed: () {},
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
            onPressed: () {},
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
            onPressed: () {},
          ),
        )
      ]
    )
  );
}
