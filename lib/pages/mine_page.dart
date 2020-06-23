/*
 * @author kevin
 * @date 2020/6/23 4:35 PM
 * @Description: flutter
*/
import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的'),
      ),
      body: Container(),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
