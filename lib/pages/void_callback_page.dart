/*
 * @Author: kevin
 * @Date: 2020-07-16 11:45:38
 * @LastEditTime: 2020-07-16 13:14:30
 * @Description: flutter
 */

import 'package:flutter/material.dart';

class VoidCallbackPage extends StatefulWidget {
  @override
  _VoidCallbackPageState createState() => _VoidCallbackPageState();
}

class _VoidCallbackPageState extends State<VoidCallbackPage> {
  int _count;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VoidCallback'),
      ),
      body: Container(
        color: Colors.white,
        child: Count(
            count: _count,
            onCountChange: (val) {
              setState(() => _count += val);
            }),
      ),
    );
  }
}

class Count extends StatelessWidget {
  final int count;
  final VoidCallback onCountSelected;

  final Function(int) onCountChange;

  Count({
    @required this.count,
    @required this.onCountChange,
    this.onCountSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            onCountChange(1);
          },
        ),
        FlatButton(
          child: Text("$count"),
          onPressed: () => onCountSelected(),
        ),
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: () {
            onCountChange(-1);
          },
        ),
      ],
    );
  }
}
