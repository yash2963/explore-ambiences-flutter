import 'package:arvyax/features/ambience/presentation/homepage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ambiences',
      theme: ThemeData(textTheme: GoogleFonts.plusJakartaSansTextTheme()),
      home: Homepage(),
    );
  }
}
