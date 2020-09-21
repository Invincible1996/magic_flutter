/*
 * @author kevin
 * @date 2020/8/26 1:59 PM
 * @Description: flutter
*/

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropDownMenuPage extends StatefulWidget {
  @override
  _DropDownMenuPageState createState() => _DropDownMenuPageState();
}

class _DropDownMenuPageState extends State<DropDownMenuPage> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DropDownMenuPage')),
      body: Container(
        child: RaisedButton(
          onPressed: () {
            Get.bottomSheet(
              Container(
                alignment: Alignment.center,
                width: 200,
                height: 200,
                color: Colors.white,
              ),
            );
          },
          child: Text('show'),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
