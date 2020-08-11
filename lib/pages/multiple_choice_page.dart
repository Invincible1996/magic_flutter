/*
 * @author kevin
 * @date 2020/6/21 10:28 PM
 * @Description: flutter
*/

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:magic_flutter/components/options_view.dart';
import 'package:magic_flutter/model/multi_choice_model.dart';
import 'package:magic_flutter/style/custom_style.dart';

class MultipleChoicePage extends StatefulWidget {
  @override
  _MultipleChoicePageState createState() => _MultipleChoicePageState();
}

class _MultipleChoicePageState extends State<MultipleChoicePage> {
  List<MultiChoiceModel> dataList = [
    MultiChoiceModel(
      question: '你最喜欢的歌曲是?',
      id: 1,
      rightAnswer: ['A', 'C'],
      options: [
        Options(
            choice: 'A',
            value: '大地',
            isCanCheck: true,
            isCheck: false,
            isRight: true),
        Options(
            choice: 'B',
            value: '真的爱你',
            isCanCheck: true,
            isCheck: false,
            isRight: false),
        Options(
            choice: 'C',
            value: '光辉岁月',
            isCanCheck: true,
            isCheck: false,
            isRight: true),
        Options(
            choice: 'D',
            value: '情人',
            isCanCheck: true,
            isCheck: false,
            isRight: false),
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
            onTap: _onPressConfirm,
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
            .map((key, item) => MapEntry(
                key,
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('${key + 1}、${item.question}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )),
                      OptionsView(
                        onOptionSelect: (selectOptions) {
                          print('=======>>>>>>$selectOptions');
                        },
                        rightAnswers: item.rightAnswer,
                        options: item.options,
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

  void _onPressConfirm() {
    // 显示正确答案 item设置为不可点击
    List<MultiChoiceModel> newList = dataList
        .map((item) => MultiChoiceModel(
              id: item.id,
              question: item.question,
              rightAnswer: item.rightAnswer,
              options: _renderOptions(item.options, item.rightAnswer),
            ))
        .toList();
    setState(() {
      dataList = newList;
    });

    //显示正确答案，错误答案的状态
  }

  _renderOptions(List<Options> options, List<String> rightAnswer) {
    return options
        .map((e) => Options(
              isRight: _renderIsRight(options, rightAnswer),
              choice: e.choice,
              isCheck: e.isCheck,
              isCanCheck: false,
              value: e.value,
            ))
        .toList();
  }

  _renderIsRight(List<Options> options, List<String> rightAnswer) {
    //如果正确答案和所选答案的长度相等 再比较元素是否相同
    for (var item in options) {
      if (rightAnswer.contains(item)) {
        //选项谁为选中
      } else {
        //错误
      }
    }
    //如果长度不等直接判定为错误,所选择的item编辑为错误
  }
}

class ChoiceItem extends StatefulWidget {
  final String choice;
  final bool isCheck;
  final bool isCanCheck;
  final String value;
  final Function(int, String, bool) onItemChecked;
  final int index;
  final bool isRight;

  const ChoiceItem({
    Key key,
    this.isCanCheck,
    this.isCheck,
    this.value,
    this.onItemChecked,
    this.choice,
    this.index,
    this.isRight,
  }) : super(key: key);

  @override
  _ChoiceItemState createState() => _ChoiceItemState();
}

class _ChoiceItemState extends State<ChoiceItem> {
  bool _isCheck = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.isCanCheck) {
          setState(() {
            _isCheck = !_isCheck;
          });
          widget.onItemChecked(widget.index, widget.choice, _isCheck);
        }
      },
      child: Container(
        height: 40,
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: _isCheck ? Colors.green : Colors.white,
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
