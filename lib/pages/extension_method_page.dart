/*
 * @author kevin
 * @date 2020/4/14 3:16 PM
 * @Description: flutter
*/

import 'package:flutter/material.dart';
import 'package:magic_flutter/extension/string_parser_extension.dart';
import 'package:magic_flutter/extension/widget_extension.dart';

class ExtensionMethodPage extends StatefulWidget {
  @override
  _ExtensionMethodPageState createState() => _ExtensionMethodPageState();
}

class _ExtensionMethodPageState extends State<ExtensionMethodPage> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ExtensionMethodPage'),
        ),
        body: buildItem("amy")
            .addNeighbor(
              buildItem("billy"),
            )
            .addNeighbor(buildItem('kobe'))
            .addNeighbor(buildItem('kobe'))
            .addNeighbor(buildItem('kobe'))
            .addNeighbor(buildItem('kobe'))
            .intoListView());
  }

  Widget buildItem(String name) {
    return Icon(Icons.phone)
        .addNeighbor(Text(name))
        .intoRow(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween)
        .intoContainer(context: context);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
