/*
 * @author kevin
 * @date 2020/8/4 1:25 下午
 * @Description: flutter
*/
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MultipleFingerPage extends StatefulWidget {
  @override
  _MultipleFingerPageState createState() => _MultipleFingerPageState();
}

class _MultipleFingerPageState extends State<MultipleFingerPage> {
  List<String> myList = [
    "January",
    "February",
    "March",
    "April",
    "June",
    "July",
    "August"
  ];

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MultipleFingerPage')),
      body: Container(
        child: SingleTouchRecognizerWidget(
          child: Container(
            color: Colors.cyan,
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

class SingleTouchRecognizerWidget extends StatelessWidget {
  final Widget child;

  SingleTouchRecognizerWidget({this.child});

  @override
  Widget build(BuildContext context) {
    return RawGestureDetector(
      gestures: <Type, GestureRecognizerFactory>{
        _SingleTouchRecognizer:
            GestureRecognizerFactoryWithHandlers<_SingleTouchRecognizer>(
          () => _SingleTouchRecognizer(),
          (_SingleTouchRecognizer instance) {},
        ),
      },
      child: child,
    );
  }
}

class _SingleTouchRecognizer extends OneSequenceGestureRecognizer {
  int _p = 0;

  @override
  void addAllowedPointer(PointerDownEvent event) {
    //first register the current pointer so that related events will be handled by this recognizer
    startTrackingPointer(event.pointer);
    //ignore event if another event is already in progress
    if (_p == 0) {
      resolve(GestureDisposition.rejected);
      _p = event.pointer;
      debugPrint('GestureDisposition.rejected-----');
    } else {
      debugPrint('GestureDisposition.accepted-----');
       debugPrint('84---multiple_finger_page-----${event.localPosition}');
      resolve(GestureDisposition.accepted);
    }
  }

  @override
  String get debugDescription => null;

  @override
  void didStopTrackingLastPointer(int pointer) {}

  @override
  void handleEvent(PointerEvent event) {
    if (!event.down && event.pointer == _p) {
      _p = 0;
       debugPrint('99---multiple_finger_page-----');
    }
    
     debugPrint('102---multiple_finger_page-----');
  }
}
