/*
 * @author kevin
 * @date 2020/4/17 1:51 下午
 * @Description: flutter
*/

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:magic_flutter/style/custom_style.dart';

class LoginUIPage extends StatefulWidget {
  @override
  _LoginUIPageState createState() => _LoginUIPageState();
}

class _LoginUIPageState extends State<LoginUIPage> {
  bool isLogin = false;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final containerWidth = MediaQuery.of(context).size.width * 0.65;
    final progress = SpinKitCircle(
      color: Colors.white,
      size: 22.0,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('LoginUIPage'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                isDense: true,
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                isDense: true,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              color: CustomStyle.themeColor,
              shape: StadiumBorder(),
              onPressed: () {
                setState(() {
                  isLogin = true;
                });
                Future.delayed(Duration(milliseconds: 800), () {
                  setState(() {
                    isLogin = false;
                  });
                });
              },
              child: Container(
                alignment: Alignment.center,
                width: containerWidth,
                child: isLogin
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '正在登录',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          progress
                        ],
                      )
                    : Text(
                        '登录',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
              ),
            ),
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
