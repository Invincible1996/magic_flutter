/*
 * @author kevin
 * @date 2020/6/11 2:53 PM
 * @Description: flutter
*/

import 'package:flutter/material.dart';
import 'package:magic_flutter/style/custom_style.dart';

class ModelContentItem extends StatelessWidget {
  final String itemTitle;
  final Function onPress;
  final bool isSelect;

  const ModelContentItem(
      {Key key,
      @required this.itemTitle,
      @required this.onPress,
      this.isSelect})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 40,
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        decoration: BoxDecoration(
            color: isSelect ? Colors.red : Colors.white,
            border: Border(
                bottom: BorderSide(
              width: 1,
              color: CustomStyle.dividerColor,
            ))),
        child: Row(
          children: <Widget>[
            Text(itemTitle),
          ],
        ),
      ),
    );
  }
}
