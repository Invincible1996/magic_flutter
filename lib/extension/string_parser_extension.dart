/*
 * @author kevin
 * @date 2020/4/14 3:30 PM
 * @Description: flutter
*/

import 'package:flutter/material.dart';

extension WidgetExt on Widget {
  //添加一个相邻的widget，返回List<Widget>
  List<Widget> addNeighbor(Widget widget) {
    return <Widget>[this, widget];
  }

//添加各种单child的widget容器
//如:Container、Padding等...
}

extension WidgetListExt<T extends Widget> on List<T> {
  //子List<Widget>列表中再添加一个相邻的widget，并返回当前列表
  List<Widget> addNeighbor(Widget widget) {
    return this..add(widget);
  }

  Row intoRow({
    Key key,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    TextDirection textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    TextBaseline textBaseline,
  }) {
    return Row(
      key: key,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
      children: this,
    );
  }

//添加其它多child的widget容器
//如:Column、ListView等...

  ListView intoListView() {
    return ListView(
      children: this,
    );
  }

}
