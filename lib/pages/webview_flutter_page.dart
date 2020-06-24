import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewFlutterPage extends StatefulWidget {
  @override
  _WebviewFlutterPageState createState() => _WebviewFlutterPageState();
}

class _WebviewFlutterPageState extends State<WebviewFlutterPage> {
  WebViewController controller;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('WebView'),
        ),
        body: Builder(
          builder: (BuildContext context) {
            return WebView(
              initialUrl:
                  'https://www.eeo.cn/webcast.php?courseKey=264908d28d67f27e',
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (controller) {
                controller = controller;
              },
              gestureNavigationEnabled: true,
              onPageStarted: (String url) {},
              onPageFinished: (String url) {},
            );
          },
        ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
