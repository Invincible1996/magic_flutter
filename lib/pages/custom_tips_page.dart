/*
 * @author kevin
 * @date 2020/6/11 7:26 PM
 * @Description: flutter
*/

import 'package:flutter/material.dart';
import 'package:magic_flutter/application.dart';
import 'package:simple_tooltip/simple_tooltip.dart';

class CustomTipsPage extends StatefulWidget {
  @override
  _CustomTipsPageState createState() => _CustomTipsPageState();
}

class _CustomTipsPageState extends State<CustomTipsPage> {
  bool _isShow = false;
  int _colorIndex = 0;
  int _sizeIndex = 0;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CustomTipsPage'),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(onPressed: () {
            setState(() {
              _isShow = !_isShow;
            });
          }),
          SizedBox(
            height: 50,
          ),
          SimpleTooltip(
            child: Container(
              width: Application.screenWidth,
              height: 45,
              color: Colors.red,
            ),
            ballonPadding: EdgeInsets.all(0),
            borderColor: Colors.grey,
            backgroundColor: Colors.grey,
            tooltipTap: () {
              print("Tooltip tap");
            },
            animationDuration: Duration(milliseconds: 500),
            show: _isShow,
            tooltipDirection: TooltipDirection.up,
            minWidth: 200,
            maxHeight: 100,
            content: Container(
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _sizeIndex = 0;
                      });
                    },
                    child: Container(
                      width: 5,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _sizeIndex = 1;
                      });
                    },
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _sizeIndex = 2;
                      });
                    },
                    child: Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7.5),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _colorIndex = 0;
                      });
                    },
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        border: Border.all(
                            width: 1,
                            color: _colorIndex == 0
                                ? Colors.white
                                : Colors.transparent),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _colorIndex = 1;
                      });
                    },
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(
                            width: 1,
                            color: _colorIndex == 1
                                ? Colors.white
                                : Colors.transparent),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _colorIndex = 2;
                      });
                    },
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        border: Border.all(
                            width: 1,
                            color: _colorIndex == 2
                                ? Colors.white
                                : Colors.transparent),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
