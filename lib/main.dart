import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plans_app/view/pages/home_page.dart';
import 'dart:typed_data';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.montserrat().fontFamily
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

