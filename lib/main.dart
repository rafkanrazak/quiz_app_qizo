import 'package:flutter/material.dart';
import 'package:quiz_app_qizo/screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Qizo Quiz App',
      home: QuizScreen(),
    );
  }
}






