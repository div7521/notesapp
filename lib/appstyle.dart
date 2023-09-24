import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Appstyle {
  static Color bgColor = Color(0xFFE8EAF6);
  static Color mainColor = Color(0xFF000000);
  static Color accentColor = Color(0xFF5C6BC0);

  static List<Color> cardsColor = [
    Colors.purple.shade200,
    Colors.deepPurple.shade400,
    Colors.blue.shade300,
    Colors.cyan.shade600,
    Colors.tealAccent,
    Colors.teal.shade200,
    Colors.deepOrange.shade300,
    Colors.pink.shade200
  ];
  static TextStyle mainTitle =
      GoogleFonts.playfairDisplay(fontSize: 18, fontWeight: FontWeight.bold);
  static TextStyle mainContent =
      GoogleFonts.playfairDisplay(fontSize: 14, fontWeight: FontWeight.normal);
  static TextStyle dateTitle =
      GoogleFonts.playfairDisplay(fontSize: 14, fontWeight: FontWeight.w500);
}
