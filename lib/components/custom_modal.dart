/*
 * @author kevin
 * @date 2020/6/11 2:51 PM
 * @Description: flutter
*/

import 'package:flutter/material.dart';
import 'package:magic_flutter/model/home_model.dart';

import 'model_content_item.dart';

class CustomModel extends StatefulWidget {
  final Function onPress;
  final List<TypeList> itemList;
  final int itemSelectIndex;

  const CustomModel(
      {Key key,
      @required this.onPress,
      @required this.itemList,
      @required this.itemSelectIndex})
      : super(key: key);

  @override
  _CustomModelState createState() => _CustomModelState();
}

class _CustomModelState extends State<CustomModel> {
  int _selectIndex = 0;

  @override
  initState() {
    super.initState();
//    _selectIndex = widget.itemSelectIndex;
  }

  @override
  Widget build(BuildContext context) {
    final _containerHeight = MediaQuery.of(context).size.height;
    final _containerWidth = MediaQuery.of(context).size.width;
    return Positioned(
        child: GestureDetector(
      onTap: () {
        widget.onPress(false);
      },
      child: AnimatedOpacity(
        opacity: 1.0,
        duration: Duration(microseconds: 1000),
        child: Container(
          width: _containerWidth,
          height: _containerHeight,
          color: Color.fromRGBO(0, 0, 0, 0.5),
          child: Column(
            children: widget.itemList
                .asMap()
                .map((index, value) => MapEntry(
                    index,
                    ModelContentItem(
                        isSelect: _selectIndex == index,
                        itemTitle: value.name,
                        onPress: () {
                          setState(() {
                            _selectIndex = index;
                          });
                          widget.onPress(false, index);
                        })))
                .values
                .toList(),
          ),
        ),
      ),
    ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
