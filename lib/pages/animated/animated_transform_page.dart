/*
 * @author kevin
 * @date 2020/6/9 10:51 AM
 * @Description: flutter
*/
import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedTransformPage extends StatefulWidget {
  @override
  _AnimatedTransformPageState createState() => _AnimatedTransformPageState();
}

class _AnimatedTransformPageState extends State<AnimatedTransformPage> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('AnimatedTransformPage'),
        ),
        body: Container(
          color: Colors.black,
          child: Transform(
            alignment: Alignment.topRight,
            transform: Matrix4.skewY(0.3)..rotateZ(-pi / 12.0),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              color: const Color(0xFFE8581C),
              child: const Text('Apartment for rent!'),
            ),
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
