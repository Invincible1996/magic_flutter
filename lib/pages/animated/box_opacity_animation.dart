/*
 * @author kevin
 * @date 2020/6/9 1:31 PM
 * @Description: flutter
*/
import 'package:flutter/material.dart';

class BoxOpacityAnimation extends StatefulWidget {
  BoxOpacityAnimation({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _BoxOpacityAnimationState createState() => _BoxOpacityAnimationState();
}

class _BoxOpacityAnimationState extends State<BoxOpacityAnimation>
    with TickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(controller);
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
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: FadeTransition(
          opacity: animation,
          child: Container(
            width: 160,
            height: 160,
            color: Colors.green,
            child: Center(
              child: Text('Box'),
            ),
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
