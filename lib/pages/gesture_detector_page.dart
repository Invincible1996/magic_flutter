/*
 * @author kevin
 * @date 2020/5/25 11:27 上午
 * @Description: flutter
*/

import 'package:flutter/material.dart';

class GestureDetectorPage extends StatefulWidget {
  @override
  _GestureDetectorPageState createState() => _GestureDetectorPageState();
}

class _GestureDetectorPageState extends State<GestureDetectorPage> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GestureDetector'),
      ),
      body: GestureDetector(
//        onPanStart: (detail) => print(detail),
//        onPanDown: (detail) => print(detail),
        onPanUpdate: (detail) => print(detail),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.red,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
