/*
 * @Author: kevin
 * @Date: 2020-06-23 13:56:40
 * @LastEditTime: 2020-06-23 15:33:22
 * @Description: flutter
 */

import 'package:flutter/material.dart';
import 'package:magic_flutter/pages/index_page.dart';
import 'package:magic_flutter/util/route_util.dart';
import 'package:permission_handler/permission_handler.dart';

import 'home_page.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  initState() {
    super.initState();
    requestPermission();
    Future.delayed(Duration(milliseconds: 1500), () {
      RouteUtil.replace(context, page: IndexPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topRight,
        padding: EdgeInsets.only(top: 25, right: 5),
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/img_splash.jpg'),
          fit: BoxFit.cover,
        )),
//        child: RaisedButton(
//          onPressed: () {
//            RouteUtil.replace(context, page: HomePage());
//          },
//          child: Text(
//            '点击跳过',
//            style: TextStyle(
//              color: Colors.white,
//            ),
//          ),
//        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  requestPermission() async {
    Map<Permission, PermissionStatus> status = await [
      // Permission.location,
      Permission.storage,
    ].request();
  }
}
