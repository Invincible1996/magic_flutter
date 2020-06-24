/*
 * @author kevin
 * @date 2020/4/17 4:56 下午
 * @Description: flutter
*/

import 'package:flutter/material.dart';
import 'package:magic_flutter/widget/triangle_painter.dart';

class ContainerPage extends StatefulWidget {
  @override
  _ContainerPageState createState() => _ContainerPageState();
}

class _ContainerPageState extends State<ContainerPage> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: CustomPaint(
        painter: TrianglePainter(
          strokeColor: Colors.red,
          strokeWidth: 2,
          paintingStyle: PaintingStyle.fill,
        ),
        child: Container(
          height: 30,
          width: 30,
          color: Colors.yellow,
        ),
      ),
    );
  }

//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(title: Text('ContainerPage')),
//      body: ListView(
//        padding: EdgeInsets.all(15),
//        children: <Widget>[
//          Container(
//            constraints: BoxConstraints(
//              maxHeight: 120.0,
//              maxWidth: 200.0,
//              minWidth: 5.0,
//              minHeight: 120,
//            ),
//            alignment: Alignment.center,
//            child: Text('1996 kobe bryant'),
//            decoration: BoxDecoration(
//                gradient: LinearGradient(
//                    begin: Alignment.topLeft,
//                    end: Alignment.bottomRight,
//                    colors: [
//                      Colors.amber,
//                      Colors.greenAccent,
//                      Colors.yellow,
//                    ]),
//                borderRadius: BorderRadius.circular(6)),
//          ),
//          SizedBox(
//            height: 10,
//          ),
//          Container(
//            constraints: BoxConstraints(
//              maxHeight: 130.0,
//              maxWidth: 200.0,
//              minWidth: 5.0,
//              minHeight: 120,
//            ),
//            alignment: Alignment.center,
//            color: Color.fromRGBO(255, 0, 0, 1),
//            child: Text('1997 tracy McGrady'),
//          ),
//          SizedBox(
//            height: 20,
//          ),
//          Bubble(
//            direction: BubbleDirection.left,
//            width: 300,
//            color: Color.fromRGBO(0, 0, 0, 0.4),
//            child: Row(
//              children: <Widget>[
//                Text('1'),
//                Text('2'),
//                Text('3'),
//                Text('4'),
//                Text('5'),
//              ],
//            ),
//          ),
//          CustomPaint(
//            painter: TrianglePainter(),
//          )
//        ],
//      ),
//    );
//  }

  @override
  void dispose() {
    super.dispose();
  }
}
