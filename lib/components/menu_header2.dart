/*
 * @author kevin
 * @date 2020/6/11 5:35 PM
 * @Description: flutter
*/

import 'package:flutter/material.dart';
import 'package:magic_flutter/model/home_model.dart';
import 'package:magic_flutter/style/custom_style.dart';

import '../application.dart';

class MenuHeader2 extends StatefulWidget {
  final Function onPress;
  final List<TypeList> typeList;

  const MenuHeader2({Key key, this.onPress, this.typeList}) : super(key: key);

  @override
  _MenuHeader2State createState() => _MenuHeader2State();
}

class _MenuHeader2State extends State<MenuHeader2> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              widget.onPress();
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      right: BorderSide(
                    width: 1,
                    color: CustomStyle.dividerColor,
                  ))),
              width: Application.screenWidth / 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(widget.typeList[1].name),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ),
          GestureDetector(
            child: Container(
              alignment: Alignment.center,
              width: Application.screenWidth / 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('城市'),
                  Icon(Icons.arrow_drop_down),
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
