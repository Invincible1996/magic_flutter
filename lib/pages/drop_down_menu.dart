/*
 * @author kevin
 * @date 2020/6/9 4:30 PM
 * @Description: flutter
*/

import 'package:flutter/material.dart';

class DropDownMenu extends StatefulWidget {
  @override
  _DropDownMenuState createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DropDownMenu'),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
