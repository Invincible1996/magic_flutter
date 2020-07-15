/*
 * @author kevin
 * @date 2020/7/15 2:58 下午
 * @Description: flutter
*/
import 'package:flutter/material.dart';
import 'package:magic_flutter/application.dart';

class WrapWidgetPage extends StatefulWidget {
  @override
  _WrapWidgetPageState createState() => _WrapWidgetPageState();
}

class _WrapWidgetPageState extends State<WrapWidgetPage> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     debugPrint('22---wrap_widget_page-----${Application.screenWidth}');
    double _containerWidth = (Application.screenWidth - 40) / 3;
    return Scaffold(
      appBar: AppBar(
        title: Text('WrapWidget'),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 10),
          child: Wrap(
            spacing: 10,
            children:
                [1, 2, 3, 4, 5, 6, 7, 8, 8, 8, 8, 8, 8, 4, 4, 4, 4, 4, 4, 4, 4, 4]
                    .asMap()
                    .map((key, value) => MapEntry(
                        key,
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.deepPurpleAccent[200],
                              borderRadius: BorderRadius.circular(5)),
                          margin: EdgeInsets.only(top: 10),
                          width: _containerWidth,
                          height: 100,
                          alignment: Alignment.center,
                          child: Text(
                            '$key',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        )))
                    .values
                    .toList(),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
