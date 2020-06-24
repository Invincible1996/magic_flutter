/*
 * @author kevin
 * @date 2020/6/23 4:24 PM
 * @Description: flutter
*/

import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:magic_flutter/pages/home_page.dart';
import 'package:magic_flutter/pages/mine_page.dart';
import 'package:magic_flutter/style/custom_style.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int _currentIndex = 0;
  List<Widget> _pageList = [
    HomePage(),
    MinePage(),
  ];

  PageController _controller = PageController();

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: PageView.builder(
          controller: _controller,
          itemCount: _pageList.length,
          physics: new NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => _pageList[index],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: CustomStyle.tabSelectColor,
        unselectedItemColor: CustomStyle.tabUnSelectColor,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(FontAwesome.home),
            title: Text('首页'),
          ),
//          BottomNavigationBarItem(icon: Icon(Entypo.search), title: Text('搜索')),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_pin), title: Text('我的')),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onTabTapped(int value) {
    setState(() => _currentIndex = value);
    _controller.jumpToPage(value);
  }
}
