/*
 * @author kevin
 * @date 2020/6/4 4:45 PM
 * @Description: flutter
*/

import 'package:flutter/material.dart';
import 'package:magic_flutter/components/custom_modal.dart';
import 'package:magic_flutter/components/menu_header2.dart';
import 'package:magic_flutter/model/home_model.dart';

class CustomDropDownMenuPage extends StatefulWidget {
  @override
  _CustomDropDownMenuPageState createState() => _CustomDropDownMenuPageState();
}

class _CustomDropDownMenuPageState extends State<CustomDropDownMenuPage>
    with TickerProviderStateMixin {
  bool _isShow = false;
  AnimationController controller;
  Animation<double> animation;
  int _modelItemIndex = 0;
  int itemSelectIndex = 0;

  final List<HomeModel> modelList = [
    HomeModel(typeId: 0, typeList: <TypeList>[
      TypeList(id: 0, name: '所有球队'),
      TypeList(id: 1, name: '湖人'),
      TypeList(id: 2, name: '火箭'),
      TypeList(id: 3, name: '热火'),
      TypeList(id: 4, name: '奇才'),
      TypeList(id: 5, name: '独行侠'),
      TypeList(id: 6, name: '勇士'),
    ]),
    HomeModel(typeId: 1, typeList: <TypeList>[
      TypeList(id: 0, name: '所有城市'),
      TypeList(id: 1, name: '洛杉矶'),
      TypeList(id: 2, name: '休斯顿'),
      TypeList(id: 3, name: '迈阿密'),
      TypeList(id: 4, name: '华盛顿'),
      TypeList(id: 5, name: '达拉斯'),
      TypeList(id: 6, name: '奥克兰'),
    ]),
  ];

  int _headerIndex = 0;

  @override
  initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CustomDropDownMenu'),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            MenuHeader2(
              typeList: modelList[0].typeList,
            ),
//            MenuHeader(
//              headerIndex: _headerIndex,
//              modelIndex: _modelItemIndex,
//              headerList: modelList,
//              currentTitle: '1996.08.13',
//              isShow: _isShow,
//              onPress: (value, index) {
//                setState(() {
//                  _isShow = value;
//                  _headerIndex = index;
//                });
//              },
//            ),
            Expanded(
                child: Stack(
              children: <Widget>[
                ListView.builder(
                    itemCount: 8,
                    itemBuilder: (context, index) => Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          margin: EdgeInsets.only(left: 15, right: 15, top: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('种豆南山下，草盛豆苗稀。'),
                              Text('晨兴理荒秽，带月荷锄归。'),
                              Text('道狭草木长，夕露沾我衣。'),
                              Text('衣沾不足惜，但使愿无违。'),
                            ],
                          ),
                        )),
                true
                    ? CustomModel(
                        itemSelectIndex: _modelItemIndex,
                        itemList: modelList[_headerIndex].typeList,
                        onPress: (value, index) {
                          setState(() {
                            _isShow = value;
                            _modelItemIndex = index;
                          });
                        },
                      )
                    : SizedBox.shrink()
              ],
            ))
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
  }
}
