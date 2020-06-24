/*
 * @author kevin
 * @date 2020/4/14 6:50 PM
 * @Description: flutter
*/

import 'package:flutter/material.dart';

extension WidgetExt on Widget {
  Container intoContainer({context}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: this,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.cyan,
          border: Border(
              bottom: BorderSide(
            width: 1,
            color: Colors.white,
          ))),
    );
  }

  ListView intoListView({BuildContext context, int size}) => ListView.builder(
        itemCount: size,
        itemBuilder: (context, index) => this,
      );
}
