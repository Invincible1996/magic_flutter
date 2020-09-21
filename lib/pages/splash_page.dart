/*
 * @Author: kevin
 * @Date: 2020-06-23 13:56:40
 * @LastEditTime: 2020-08-11 13:58:41
 * @Description: flutter
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magic_flutter/application.dart';
import 'package:magic_flutter/pages/index_page.dart';
import 'package:magic_flutter/provider/login_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  initState() {
    super.initState();
    requestPermission();
    Future.delayed(Duration(milliseconds: 2000), () {
//      RouteUtil.replace(context, page: IndexPage());
      Get.offAll(IndexPage());
      Provider.of<LoginProvider>(context, listen: false).initUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    Application.screenWidth = MediaQuery.of(context).size.width;
    Application.screeHeight = MediaQuery.of(context).size.height;

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
    await [
      // Permission.location,
      Permission.storage,
    ].request();
  }
}
