import 'package:flutter/material.dart';

class IntroductionPage extends StatefulWidget {
  @override
  _IntroductionPageState createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: GestureDetector(
            child: FloatingActionButton(
      child: Icon(Icons.home),
      onPressed: () {
        Navigator.pushReplacementNamed(context, "/home");
      },
    )));
  }
}
