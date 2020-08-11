/*
 * @author kevin
 * @date 2020/6/21 10:28 PM
 * @Description: flutter
*/

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:magic_flutter/model/multi_choice_model.dart';
import 'package:magic_flutter/style/custom_style.dart';
import 'package:oktoast/oktoast.dart';

class MultipleChoicePage extends StatefulWidget {
  @override
  _MultipleChoicePageState createState() => _MultipleChoicePageState();
}

class _MultipleChoicePageState extends State<MultipleChoicePage> {
  List<MultiChoiceModel> dataList = [
    MultiChoiceModel(
      question: '你做喜欢的歌曲是?',
      id: 1,
      rightAnswer: ['A', 'C'],
      options: [
        Options(choice: 'A', value: '大地'),
        Options(choice: 'B', value: '真的爱你'),
        Options(choice: 'C', value: '光辉岁月'),
        Options(choice: 'D', value: '情人'),
      ],
    )
  ];

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MultipleChoicePage'),
        actions: <Widget>[
          GestureDetector(
            onTap: () => showToast('msg'),
            child: Row(
              children: <Widget>[
                Text('确定',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          )
        ],
      ),
      body: PageView(
        children: dataList
            .asMap()
            .map((key, value) => MapEntry(
                key,
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('${key + 1}、${value.question}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )),
                      Wrap(
                        children: value.options
                            .asMap()
                            .map((key, value) => MapEntry(
                                key,
                                ChoiceItem(
                                  choice: value.choice,
                                  value: value.value,
                                )))
                            .values
                            .toList(),
                      )
                    ],
                  ),
                )))
            .values
            .toList(),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class ChoiceItem extends StatefulWidget {
  final String choice;
  final bool isSelect;
  final String value;
  final Function onPress;

  const ChoiceItem({
    Key key,
    this.isSelect,
    this.value,
    this.onPress,
    this.choice,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(child: Text('${widget.choice}')),
            Text('、${widget.value}'),
          ],
        ),
      ),
    );
  }
}
