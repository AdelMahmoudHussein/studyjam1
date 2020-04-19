import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  SecondScreen(this.pair);

  final pair;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Text(
            pair.toString(),
            style: TextStyle(
              fontSize: 55,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}