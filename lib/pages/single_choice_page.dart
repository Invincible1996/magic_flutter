/*
 * @Author: kevin
 * @Date: 2020-08-08 11:56:10
 * @LastEditTime: 2020-08-08 15:00:46
 * @Description: 单选题
 */

import 'package:flutter/material.dart';
import 'package:magic_flutter/model/choice_model.dart';
import 'package:oktoast/oktoast.dart';

class SingleChoicePage extends StatefulWidget {
  @override
  _SingleChoicePageState createState() => _SingleChoicePageState();
}

class _SingleChoicePageState extends State<SingleChoicePage> {
  List<ChoiceModel> dataList = [
    ChoiceModel(
        chooice: 'A',
        value: '细雨带风1',
        isCanSelect: true,
        isRightAnswer: false,
        isSeclect: false),
    ChoiceModel(
        chooice: 'B',
        value: '细雨带风2',
        isCanSelect: true,
        isRightAnswer: false,
        isSeclect: false),
    ChoiceModel(
        chooice: 'C',
        value: '细雨带风3',
        isCanSelect: true,
        isRightAnswer: false,
        isSeclect: false),
    ChoiceModel(
        chooice: 'D',
        value: '细雨带风4',
        isCanSelect: true,
        isRightAnswer: true,
        isSeclect: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('选择题'),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: dataList
              .asMap()
              .map((key, value) => MapEntry(
                  key,
                  ChoiceItem(
                    isCanSelect: value.isCanSelect,
                    index: key,
                    choice: value.chooice,
                    value: value.value,
                    isRightAnswer: value.isRightAnswer,
                    isSelect: value.isSeclect,
                    onItemSelect: (index, isRightAnswer, choice) {
                      //根据index 修改源数据 (当选完答案以后其他选项不可点击)

                      //如果选择的是错误的答案，需要将正确答案展示出来,将数据源中正确答案的isSelect改为true
                      if (!isRightAnswer) {
                        showToast('回答错误');
                        List<ChoiceModel> newList2 = dataList
                            .map((e) => ChoiceModel(
                                  chooice: e.chooice,
                                  value: e.value,
                                  isCanSelect: false,
                                  isRightAnswer: e.isRightAnswer,
                                  isSeclect:
                                      e.isRightAnswer || e.chooice == choice,
                                ))
                            .toList();
                        setState(() {
                          dataList = newList2;
                        });
                      } else {
                        showToast('回答正确');
                        //如果选择的是正确答案，将其他的状态改为不可选中即可
                        List<ChoiceModel> newList = dataList
                            .map((e) => ChoiceModel(
                                  chooice: e.chooice,
                                  value: e.value,
                                  isCanSelect: false,
                                  isRightAnswer: e.isRightAnswer,
                                  isSeclect: e.chooice == choice,
                                ))
                            .toList();
                        setState(() {
                          dataList = newList;
                        });
                      }
                    },
                  )))
              .values
              .toList(),
        ),
      ),
    );
  }
}

class ChoiceItem extends StatefulWidget {
  final String choice;
  final String value;
  final bool isRightAnswer;
  final bool isSelect;
  final bool isCanSelect;
  final Function(int, bool, String) onItemSelect;
  final int index;

  ChoiceItem({
    Key key,
    @required this.choice,
    @required this.value,
    this.isRightAnswer,
    this.isSelect,
    this.onItemSelect,
    this.index,
    this.isCanSelect,
  }) : super(key: key);

  @override
  _ChoiceItemState createState() => _ChoiceItemState();
}

class _ChoiceItemState extends State<ChoiceItem> {
  bool _isSelect = false;
  bool _isCanSelect = true;

  @override
  void initState() {
    super.initState();

    setState(() {
      _isSelect = widget.isSelect;
      _isCanSelect = widget.isCanSelect;
    });
  }

  @override
  void didUpdateWidget(ChoiceItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      _isCanSelect = widget.isCanSelect;
      _isSelect = widget.isSelect;
    });
    print(widget.isCanSelect);
    print(widget.isSelect);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(_isCanSelect);

        // if (widget.isRightAnswer) {
        //   showToast('回答正确');
        //   setState(() {
        //     _isSelect = true;
        //     _isCanSelect = false;
        //   });
        //   return;
        // }

        if (_isCanSelect) {
          // setState(() {
          //   _isSelect = !_isSelect;
          // });
          widget.onItemSelect(
              widget.index, widget.isRightAnswer, widget.choice);
        } else {}
      },
      child: Container(
        margin: EdgeInsets.only(top: 10),
        width: 400,
        height: 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: _renderItemColor(),
            border: Border.all(width: 1, color: Color(0XFFEEEEEE))),
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text('${widget.choice}、'),
                Text('${widget.value}')
              ],
            ),
            Icon(Icons.check)
          ],
        ),
      ),
    );
  }

  Color _renderItemColor() {
    if (_isSelect) {
      if (widget.isRightAnswer) {
        return Colors.green;
      } else {
        return Colors.red;
      }
    } else {
      return Colors.white;
    }
  }
}
