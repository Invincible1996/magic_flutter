/*
 * @author kevin
 * @date 2020/4/27 10:51 上午
 * @Description: flutter
*/

import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';
import 'package:magic_flutter/extension/widget_extension.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ListViewPage')),
      body: Text('data')
          .intoContainer(context: context)
          .intoListView(context: context, size: 20),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class DashPathPainter extends CustomPainter {
  final Path p = Path()
//    ..moveTo(10.0, 10.0)
//    ..lineTo(100.0, 100.0)
    ..addOval(Rect.fromLTWH(10.0, 10.0, 100.0, 100.0));

//    ..quadraticBezierTo(125.0, 20.0, 200.0, 100.0)
//    ..addRect(Rect.fromLTWH(0.0, 0.0, 50.0, 50.0));

  @override
  bool shouldRepaint(DashPathPainter oldDelegate) => true;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint black = Paint()
      ..color = Colors.redAccent
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(Offset(60, 60), 60, black);
    canvas.drawPath(
        dashPath(
          p,
          dashArray: CircularIntervalList<double>(
            <double>[5.0, 2.5],
          ),
        ),
        black);
  }
}
