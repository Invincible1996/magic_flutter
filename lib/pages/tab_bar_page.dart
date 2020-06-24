/*
 * @author kevin
 * @date 2020/5/14 2:41 下午
 * @Description: flutter
*/

import 'package:flutter/material.dart';
import 'package:magic_flutter/style/custom_style.dart';

class TabBarPage extends StatefulWidget {
  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> with TickerProviderStateMixin {
  TabController _tabController;

  @override
  initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          elevation: 0,
        ),
        preferredSize: Size.zero,
      ),
      body: Container(
        decoration: BoxDecoration(
            color: CustomStyle.themeColor,
            border:
                Border(bottom: BorderSide(width: 1, color: Color(0XFFeeeeee)))),
        child: Column(
          children: <Widget>[
            Container(
              height: 50,
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Expanded(
                    flex: 1,
                    child: TabBar(
                      onTap: (value) {
                        debugPrint('58---tab_bar_page-----$value');
                      },
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.grey,
                      labelStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      unselectedLabelStyle:
                          TextStyle(fontSize: 16, color: Colors.grey),
                      indicator: BoxDecoration(),
                      controller: _tabController,
                      tabs: [
                        Tab(
                          child: Stack(
                            children: <Widget>[
                              Container(
                                child: Text('发现'),
                                padding: EdgeInsets.all(10),
                              ),
                              Positioned(
                                right: 4,
                                  top: 8,
                                  child: Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(20)),
                              ))
                            ],
                          ),
                        ),
                        Tab(
                          text: '我的',
                        ),
                        Tab(
                          text: '动态',
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.transparent,
                    ),
                    onPressed: null,
                  ),
                ],
              ),
            ),
            Flexible(
                flex: 1,
                child: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    Container(
                      color: Colors.white,
                      child: Text('细雨带风湿透黄昏的街道'),
                    ),
                    Container(
                      color: Colors.white,
                    ),
                    Container(
                      color: Colors.white,
                    ),
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
  }
}
