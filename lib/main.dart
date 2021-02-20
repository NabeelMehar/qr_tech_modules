import 'package:flutter/material.dart';
import 'package:qr_tech_demo/get_verified_screens/ChooseIdScreen.dart';
import 'package:qr_tech_demo/get_verified_screens/GetVerifiedScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChooseIdScreen(),
    );
  }
}