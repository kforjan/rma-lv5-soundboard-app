import 'package:flutter/material.dart';
import 'package:rma_lv5_soundboard_app/ui/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Soundboard App',
      home: HomeScreen(),
    );
  }
}
