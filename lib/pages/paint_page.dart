/*
 * @author kevin
 * @date 2020/7/24 5:15 下午
 * @Description: flutter
*/

import 'package:flutter/material.dart';

class PaintPage extends StatefulWidget {
  @override
  _PaintPageState createState() => _PaintPageState();
}

class _PaintPageState extends State<PaintPage> {
  List<Offset> _points = <Offset>[];

  //屏幕上手指的个数
  List<int> _pointerList = [];

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PaintPage'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  _points.clear();
                });
              })
        ],
      ),
      body: Stack(
        children: <Widget>[
          Listener(
            onPointerDown: _onPointerDown,
            onPointerMove: _onPointerMove,
            onPointerUp: _onPointerUp,
            child: Container(
              color: Colors.white,
            ),
          ),
          CustomPaint(
            painter: SignaturePainter(_points),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onPointerDown(PointerDownEvent event) {
    _pointerList.add(event.pointer);
//    debugPrint('47---_onPointerDown-----${event.localPosition}');
  }

  void _onPointerMove(PointerMoveEvent event) {
    debugPrint('69---paint_page-----$_pointerList');
//    debugPrint('47---_onPointerMove-----${event.localPosition}');
    if (_pointerList.length > 1) {
      return;
    } else {
      setState(() {
        _points = new List.from(_points)..add(event.localPosition);
      });
    }
  }

  void _onPointerUp(PointerUpEvent event) {
    _pointerList.remove(event.pointer);
//    debugPrint('47---_onPointerUp-----${event.localPosition}');
    _points.add(null);
  }
}

class SignaturePainter extends CustomPainter {
  SignaturePainter(this.points);

  final List<Offset> points;

  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1.0;
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null)
        canvas.drawLine(points[i], points[i + 1], paint);
    }
  }

  bool shouldRepaint(SignaturePainter other) => other.points != points;
}

class PointModel {
  final List<Offset> pointList;

  PointModel({this.pointList});
}
