import 'package:flutter/material.dart';
import 'package:travel_app/screens/details_page.dart';
import 'package:travel_app/screens/navPages/main_page.dart';
import 'package:travel_app/screens/on_boarding_screen.dart';

void main() {
  runApp(TravelApp());
}

class TravelApp extends StatelessWidget {
  const TravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DetailPage(),
    );
  }
}
