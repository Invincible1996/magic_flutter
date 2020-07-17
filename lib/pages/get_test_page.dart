/*
 * @author kevin
 * @date 2020/7/17 3:08 下午
 * @Description: flutter
*/

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:magic_flutter/pages/home_page.dart';

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
                Get.offAll(HomePage());
              },
              child: Text(
                'AlertDialog',
                style: Theme.of(context).textTheme.subtitle1,
              ),
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
