import 'package:flutter/material.dart';

class TestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('data',
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
          )),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.cyanAccent,
        gradient: LinearGradient(
          colors: [
            Colors.deepOrange,
            Colors.yellow,
          ],
          stops: [0.0, 0.7],
        ),
      ),
    );
  }
}
