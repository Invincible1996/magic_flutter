/*
 * @author kevin
 * @date 2020/6/9 1:29 PM
 * @Description: flutter
*/
import 'package:flutter/material.dart';

class BoxScaleAnimation extends StatefulWidget {
  BoxScaleAnimation({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _BoxScaleAnimationState createState() => _BoxScaleAnimationState();
}

class _BoxScaleAnimationState extends State<BoxScaleAnimation>
    with TickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        print("completed");
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        print("dismissed");
        controller.forward();
      } else if (status == AnimationStatus.forward) {
        print("forward");
      } else if (status == AnimationStatus.reverse) {
        print("reverse");
      }
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title ?? '')),
      body: Center(
        child: ScaleTransition(
          alignment: Alignment.center,
          scale: controller,
          child: Container(
            width: 200,
            height: 200,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
