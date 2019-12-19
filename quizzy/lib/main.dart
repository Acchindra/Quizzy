import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    new MaterialApp(
      title: "Quizzy",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Quizzy", style: GoogleFonts.lato()),
        ),
      ),
    ),
  );
}