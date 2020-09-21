/*
 * @author kevin
 * @date 2020/9/21 7:10 下午
 * @Description: flutter
*/
import 'package:flutter/material.dart';

class CustomCalendarPage extends StatefulWidget {
  @override
  _CustomCalendarPageState createState() => _CustomCalendarPageState();
}

class _CustomCalendarPageState extends State<CustomCalendarPage> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CustomCalendarPage')),
      body: Container(
        color: Colors.green,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
