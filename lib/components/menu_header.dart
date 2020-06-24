/*
 * @author kevin
 * @date 2020/6/11 2:51 PM
 * @Description: flutter
*/

import 'package:flutter/material.dart';
import 'package:magic_flutter/model/home_model.dart';
import 'package:magic_flutter/style/custom_style.dart';

import 'menu_header_item.dart';

class MenuHeader extends StatefulWidget {
  final bool isShow;
  final Function onPress;
  final String currentTitle;
  final List<HomeModel> headerList;
  final int modelIndex;
  final int headerIndex;
  final List itemList;

  const MenuHeader(
      {Key key,
      this.isShow,
      this.onPress,
      @required this.currentTitle,
      this.headerList,
      this.modelIndex,
      this.headerIndex,
      this.itemList})
      : super(key: key);

  @override
  _MenuHeaderState createState() => _MenuHeaderState();
}

class _MenuHeaderState extends State<MenuHeader> {
  bool _isShow;
  int _currentIndex = 0;
  int _modeIndex = 0;

  @override
  initState() {
    super.initState();
    _isShow = widget.isShow;
    _modeIndex = widget.modelIndex;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  /// 组件接收到新的属性值的时候调用 类似于 React componentWillReceiveProps
  @override
  void didUpdateWidget(MenuHeader oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      _isShow = widget.isShow;
      _modeIndex = widget.modelIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _containerHeight = MediaQuery.of(context).size.height;
    final _containerWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: <Widget>[
        Container(
          height: _containerHeight * .07,
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
            width: 1,
            color: CustomStyle.dividerColor,
          ))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: widget.headerList
                .asMap()
                .map((i, value) => MapEntry(
                      i,
                      MenuHeaderItem(
                        index: i,
                        headerList: widget.headerList,
                        iconData: _currentIndex == i && _isShow
                            ? Icons.arrow_drop_up
                            : Icons.arrow_drop_down,
                        titleTextColor: _currentIndex == i && _isShow
                            ? CustomStyle.themeColor
                            : null,
                        itemTitle: value.typeList[_modeIndex].name,
                        containerWidth: _containerWidth,
                        onPress: () {
                          if (_currentIndex == i) {
                            setState(() {
                              _isShow = !_isShow;
                            });
                          } else {
                            setState(() {
                              _isShow = true;
                            });
                          }
                          setState(() {
                            _currentIndex = i;
                          });
                          widget.onPress(_isShow, _currentIndex);
                        },
                      ),
                    ))
                .values
                .toList(),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  String renderTitle() {
    return widget.itemList[1][_modeIndex];
  }
}
