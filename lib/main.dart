import 'package:flutter/material.dart';
import 'package:project_07600442/pages/bmi_calculator_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const BMIPage(),
    );
  }
}
