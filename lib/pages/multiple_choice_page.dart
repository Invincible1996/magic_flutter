/*
 * @author kevin
 * @date 2020/6/21 10:28 PM
 * @Description: flutter
*/

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:magic_flutter/style/custom_style.dart';

class MultipleChoicePage extends StatefulWidget {
  @override
  _MultipleChoicePageState createState() => _MultipleChoicePageState();
}

class _MultipleChoicePageState extends State<MultipleChoicePage> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MultipleChoicePage'),
      ),
      body: PageView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '多选题：',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                    '根据《中华人名共和国民法典》，自然人享有民权，有依法____、____、____、或者____他人使用自己的姓名，但是不得违背公序良俗。'),
                SizedBox(
                  height: 20,
                ),
                ChoiceItem(
                  isSelect: false,
                  value: 'A.决定',
                ),
                ChoiceItem(
                  isSelect: true,
                  value: 'B.使用',
                ),
                ChoiceItem(
                  isSelect: false,
                  value: 'C.变更',
                ),
                ChoiceItem(
                  isSelect: true,
                  value: 'D.许可',
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '多选题：',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                    '根据《中华人名共和国民法典》，自然人享有民权，有依法____、____、____、或者____他人使用自己的姓名，但是不得违背公序良俗。'),
                SizedBox(
                  height: 20,
                ),
                ChoiceItem(
                  isSelect: false,
                  value: 'A.决定',
                ),
                ChoiceItem(
                  isSelect: true,
                  value: 'B.使用',
                ),
                ChoiceItem(
                  isSelect: false,
                  value: 'C.变更',
                ),
                ChoiceItem(
                  isSelect: true,
                  value: 'D.许可',
                ),
              ],
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

class ChoiceItem extends StatefulWidget {
  final bool isSelect;
  final String value;
  final Function onPress;

  const ChoiceItem({
    Key key,
    this.isSelect,
    this.value,
    this.onPress,
  }) : super(key: key);

  @override
  _ChoiceItemState createState() => _ChoiceItemState();
}

class _ChoiceItemState extends State<ChoiceItem> {
  bool _isSelect = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelect = !_isSelect;
        });
      },
      child: Container(
        height: 40,
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: _isSelect ? Colors.green : Colors.white,
            border: Border.all(
              width: 1,
              color: CustomStyle.dividerColor,
            )),
        child: Row(
          children: <Widget>[
            Text('${widget.value}'),
          ],
        ),
      ),
    );
  }
}
