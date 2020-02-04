import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget quizCard(String name, String des){
    const cardcolor = Color(0xff49BEAA);
    const buttoncolor = Color(0xffEEB868);
    return Center(
      child: Card(
        color: cardcolor,
        elevation: 20,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.assignment),
              title: Text(name, style: GoogleFonts.bungee(fontSize: 20, textStyle: TextStyle(color: Colors.white))),
              subtitle: Text(des, style: GoogleFonts.bungee(fontSize: 15, textStyle: TextStyle(color: Colors.white))),
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Text('Play', style: GoogleFonts.bungee(textStyle: TextStyle(color: Colors.white))),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  color: buttoncolor,
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
}