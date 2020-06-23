/*
 * @author kevin
 * @date 2020/6/23 1:46 PM
 * @Description: flutter
*/
import 'package:flutter/material.dart';
import 'package:magic_flutter/style/custom_style.dart';

class ListItem extends StatelessWidget {
  final String title;
  final Function onPress;

  const ListItem({
    Key key,
    this.title,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onPress,
        child: Container(
          margin: EdgeInsets.only(top: 8, left: 10, right: 10),
          height: 45,
          padding: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: CustomStyle.themeColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title ?? '',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.arrow_right,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
