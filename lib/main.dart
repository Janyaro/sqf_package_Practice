import 'package:flutter/material.dart';
import 'package:sqll/Screens/SplashScreen.dart';
import 'package:sqll/Screens/Table.dart';
import 'package:sqll/Screens/showScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Splash(),
    );
  }
}
