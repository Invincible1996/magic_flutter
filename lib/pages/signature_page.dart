/*
 * @author kevin
 * @date 2020/5/25 11:14 上午
 * @Description: flutter
*/

import 'package:flutter/material.dart';
import 'package:magic_flutter/widget/signature_painter.dart';

class SignaturePage extends StatefulWidget {
  @override
  _SignaturePageState createState() => _SignaturePageState();
}

class _SignaturePageState extends State<SignaturePage> {
  @override
  initState() {
    super.initState();
  }

  List<Offset> _points = <Offset>[];
  GlobalKey _globalKey = GlobalKey();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          GestureDetector(
//            onPanUpdate: (DragUpdateDetails details) {
//              RenderBox referenceBox = context.findRenderObject();
//              Offset localPosition =
//              referenceBox.globalToLocal(details.globalPosition);
//
//              setState(() {
//                _points = new List.from(_points)..add(localPosition);
//              });
//            },
            onPanUpdate: (details) => _addPoint(details),
            onPanEnd: (DragEndDetails details) => _points.add(null),
          ),
          CustomPaint(painter: SignaturePainter(_points))
        ],
      ),
    );
  }

  /// 添加点，注意不要超过Widget范围
  _addPoint(DragUpdateDetails details) {
    RenderBox referenceBox = _globalKey.currentContext.findRenderObject();
    Offset localPosition = referenceBox.globalToLocal(details.globalPosition);
    double maxW = referenceBox.size.width;
    double maxH = referenceBox.size.height;
    // 校验范围
    if (localPosition.dx <= 0 || localPosition.dy <= 0) return;
    if (localPosition.dx > maxW || localPosition.dy > maxH) return;
    setState(() {
      _points = List.from(_points)..add(localPosition);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
