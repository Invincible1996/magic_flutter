/*
 * @author kevin
 * @date 2020/6/23 1:37 PM
 * @Description: flutter
*/

import 'package:flutter/material.dart';
import 'package:magic_flutter/components/list_item.dart';
import 'package:magic_flutter/pages/download_pdf_page.dart';
import 'package:magic_flutter/pages/shop_cart_page.dart';
import 'package:magic_flutter/util/route_util.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Magic Flutter'),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            ListItem(
              title: 'download pdf',
              onPress: () => RouteUtil.push(context, page: DownloadPdfPage()),
            ),
            ListItem(
              title: 'ShopCartPage',
              onPress: () => RouteUtil.push(context, page: ShopCartPage()),
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
