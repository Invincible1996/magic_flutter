/*
 * @author kevin
 * @date 2020/6/8 7:38 PM
 * @Description: flutter
*/

import 'package:flutter/material.dart';

class AnimatedOpacityPage extends StatefulWidget {
  @override
  _AnimatedOpacityPageState createState() => _AnimatedOpacityPageState();
}

class _AnimatedOpacityPageState extends State<AnimatedOpacityPage>
    with TickerProviderStateMixin {
  bool _visible = false;
  AnimationController controller;
  Animation<Offset> animation;

  @override
  initState() {
    super.initState();

    //初始化
    //用来控制动画的开始与结束以及设置动画的监听
    //vsync参数，存在vsync时会防止屏幕外动画（动画的UI不在当前屏幕时）消耗不必要的资源
    //duration 动画的时长，这里设置的 seconds: 2 为2秒，当然也可以设置毫秒 milliseconds：2000.
    controller = AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);
    //动画开始、结束、向前移动或向后移动时会调用StatusListener
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //AnimationStatus.completed 动画在结束时停止的状态
//        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        //AnimationStatus.dismissed 表示动画在开始时就停止的状态
//        controller.forward();
      }
    });
    //begin: Offset.zero, end: Offset(1, 0) 以左下角为参考点，相对于左下角坐标 x轴方向向右 平移执行动画的view 的1倍 宽度，y轴方向不动，也就是水平向右平移
    //begin: Offset.zero, end: Offset(1, 1) 以左下角为参考点，相对于左下角坐标 x轴方向向右 平移执行动画的view 的1倍 宽度，y轴方向 向下 平衡执行动画view 的1倍的高度，也就是向右下角平移了
    animation =
        Tween(begin: Offset(0, -1), end: Offset(0, 0)).animate(controller);

//开始执行动画
    Future.delayed(Duration(milliseconds: 600), () {
      controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedOpacity'),
      ),
      body: AnimatedOpacity(
        opacity: _visible ? 1.0 : 0.0,
        duration: Duration(milliseconds: 500),
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height - 200,
              color: Color.fromRGBO(0, 0, 0, 0.3),
//          child: SlideView(),
            ),
            Positioned(
                child: _visible
                    ? SlideView(
                        animation: animation,
                        controller: controller,
                      )
                    : SizedBox.shrink()),
            Positioned(
                bottom: 0,
                child: RaisedButton(
                  onPressed: () {
//                    controller.forward();
                    controller.addStatusListener((status) {
                      debugPrint('80---animated_opacity_page-----$status');
                      if (status == AnimationStatus.completed) {
                        //AnimationStatus.completed 动画在结束时停止的状态
                        controller.reverse();
                      } else if (status == AnimationStatus.dismissed) {
                        //AnimationStatus.dismissed 表示动画在开始时就停止的状态
                        controller.reverse();
                      }
                    });
                  },
                  child: Text('show'),
                ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _visible = !_visible;
          });
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
  }
}

class SlideView extends StatefulWidget {
  final AnimationController controller;
  final Animation<Offset> animation;

  const SlideView({
    Key key,
    this.controller,
    this.animation,
  }) : super(key: key);

  @override
  _SlideViewState createState() => _SlideViewState();
}

class _SlideViewState extends State<SlideView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _containerWidth = MediaQuery.of(context).size.width;
    return Container(
      width: _containerWidth,
      height: 120,
      child: SlideTransition(
        position: widget.animation,
        //将要执行动画的子view
        child: Container(
          width: _containerWidth,
          height: 120,
          color: Colors.white,
          child: Column(
            children: <Widget>[Text('data')],
          ),
        ),
      ),
    );
  }
}
