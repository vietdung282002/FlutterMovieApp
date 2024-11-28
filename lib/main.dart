import 'package:flutter/material.dart';
import 'package:movie_app/colors.dart';
import 'package:movie_app/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(scaffoldBackgroundColor: backgroundColor),
      home: HomeScreen(),
    );
  }
}
