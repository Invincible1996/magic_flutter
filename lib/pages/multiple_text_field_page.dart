/*
 * @author kevin
 * @date 2020/6/21 10:28 PM
 * @Description: flutter
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MultipleTextFieldPage extends StatefulWidget {
  @override
  _MultipleTextFieldPageState createState() => _MultipleTextFieldPageState();
}

class _MultipleTextFieldPageState extends State<MultipleTextFieldPage> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MultipleTextFieldPage'),
      ),
      body: Container(
        padding: EdgeInsets.all(5),
        child: Row(
          children: <Widget>[
            Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(border: Border.all(width: 1)),
                child: TextField(
                  showCursor: false,
                  textAlign: TextAlign.center,
                  style: TextStyle(height: 2.0),
                  cursorColor: Color(0XFFEEEEEE),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      isDense: true,
                      border: InputBorder.none
//                    border: OutlineInputBorder(
//                      borderRadius: BorderRadius.circular(3.0),
//                      borderSide: BorderSide(
//                        color: Colors.amber,
//                        style: BorderStyle.solid,
//                      ),
//                    ),
                      ),
                )),
            SizedBox(
              width: 10,
            ),
            Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(border: Border.all(width: 1)),
                child: TextField(
                  showCursor: false,
                  textAlign: TextAlign.center,
                  style: TextStyle(height: 2.0),
                  cursorColor: Color(0XFFEEEEEE),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      isDense: true,
                      border: InputBorder.none
//                    border: OutlineInputBorder(
//                      borderRadius: BorderRadius.circular(3.0),
//                      borderSide: BorderSide(
//                        color: Colors.amber,
//                        style: BorderStyle.solid,
//                      ),
//                    ),
                      ),
                )),
            SizedBox(
              width: 10,
            ),
            Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(border: Border.all(width: 1)),
                child: TextField(
                  showCursor: false,
                  textAlign: TextAlign.center,
                  style: TextStyle(height: 2.0),
                  cursorColor: Color(0XFFEEEEEE),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      isDense: true,
                      border: InputBorder.none
//                    border: OutlineInputBorder(
//                      borderRadius: BorderRadius.circular(3.0),
//                      borderSide: BorderSide(
//                        color: Colors.amber,
//                        style: BorderStyle.solid,
//                      ),
//                    ),
                      ),
                )),
            SizedBox(
              width: 10,
            ),
            Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(border: Border.all(width: 1)),
                child: TextField(
                  showCursor: false,
                  textAlign: TextAlign.center,
                  style: TextStyle(height: 2.0),
                  cursorColor: Color(0XFFEEEEEE),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      isDense: true,
                      border: InputBorder.none
//                    border: OutlineInputBorder(
//                      borderRadius: BorderRadius.circular(3.0),
//                      borderSide: BorderSide(
//                        color: Colors.amber,
//                        style: BorderStyle.solid,
//                      ),
//                    ),
                      ),
                )),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
