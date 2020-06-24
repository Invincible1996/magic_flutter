/*
 * @author kevin
 * @date 2020/6/11 2:54 PM
 * @Description: flutter
*/

import 'package:flutter/material.dart';
import 'package:magic_flutter/model/home_model.dart';
import 'package:magic_flutter/style/custom_style.dart';

class MenuHeaderItem extends StatefulWidget {
  final double containerWidth;
  final Color itemColor;
  final String itemTitle;
  final Function onPress;
  final Color titleTextColor;
  final IconData iconData;
  final int index;
  final List<HomeModel> headerList;

  const MenuHeaderItem({
    Key key,
    this.containerWidth,
    this.itemColor,
    @required this.itemTitle,
    @required this.onPress,
    this.titleTextColor,
    this.iconData,
    @required this.index,
    @required this.headerList,
  }) : super(key: key);

  @override
  _MenuHeaderItemState createState() => _MenuHeaderItemState();
}

class _MenuHeaderItemState extends State<MenuHeaderItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
//        onPress();
        widget.onPress();
      },
      child: Container(
        width: (widget.containerWidth - widget.headerList.length) / widget.headerList.length,
        height: 50,
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: widget.itemColor ?? Colors.white,
            border: Border(
                right: BorderSide(
                  width: 1,
                  color: widget.index == widget.headerList.length - 1
                      ? Colors.transparent
                      : CustomStyle.dividerColor,
                ))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.itemTitle,
              style: TextStyle(
                color: widget.titleTextColor ?? Colors.black,
              ),
            ),
            Icon(
              widget.iconData ?? Icons.arrow_drop_down,
              color: widget.titleTextColor,
            )
          ],
        ),
        alignment: Alignment.center,
      ),
    );
  }
}