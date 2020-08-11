/*
 * @author kevin
 * @date 2020/7/17 3:08 下午
 * @Description: flutter
*/

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:magic_flutter/application.dart';

class GetTestPage extends StatefulWidget {
  @override
  _GetTestPageState createState() => _GetTestPageState();
}

class _GetTestPageState extends State<GetTestPage> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GetTestPage')),
      body: Container(
        padding: EdgeInsets.all(10),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Get.dialog(
                    Container(
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          width: Application.screenWidth * 0.85,
                          height: 200,
                          child: Column(
                            children: <Widget>[
                              Text(
                                '删除',
                                style: Theme.of(context).textTheme.headline1,
                              ),
                              Text(
                                '确认删除当前页面',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              FlatButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: Text('close'))
                            ],
                          ),
                        ),
                      ),
                    ),
                    barrierDismissible: false);
              },
              child: Text(
                'AlertDialog',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            RaisedButton(
              onPressed: () {
                Get.bottomSheet(Container(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    width: Application.screenWidth,
                    height: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '上海',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        Text(
                          '深圳',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ],
                    ),
                  ),
                ));
              },
              child: Text(
                'bottomSheet',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            RaisedButton(
              child: Text('SnackBar'),
              onPressed: () {
                Get.snackbar('title', 'message',
                    backgroundColor: Colors.red,
                    snackPosition: SnackPosition.TOP,
                    borderRadius: 5,
                    maxWidth: Application.screenWidth);
              },
            )
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
