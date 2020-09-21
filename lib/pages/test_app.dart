/*
 * @Author: kevin
 * @Date: 2020-08-10 13:50:43
 * @LastEditTime: 2020-08-17 14:13:29
 * @Description: flutter
 */
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
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
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
