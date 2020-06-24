/*
 * @author kevin
 * @date 2020/6/8 7:25 PM
 * @Description: flutter
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magic_flutter/style/custom_style.dart';
import 'package:magic_flutter/util/route_util.dart';

import 'animated_opacity_page.dart';
import 'animated_page.dart';
import 'animated_transform_page.dart';
import 'box_opacity_animation.dart';
import 'box_rotation_animation.dart';
import 'box_scale_animation.dart';

class AnimatedListPage extends StatefulWidget {
  @override
  _AnimatedListPageState createState() => _AnimatedListPageState();
}

class _AnimatedListPageState extends State<AnimatedListPage> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedListPage'),
      ),
      body: ListView(
        children: <Widget>[
          AnimatedListItem(
            title: 'Opacity',
            onPress: () => RouteUtil.push(context, page: AnimatedOpacityPage()),
          ),
          AnimatedListItem(
            title: 'Translation',
            onPress: () =>
                RouteUtil.push(context, page: AnimatedTransformPage()),
          ),
          AnimatedListItem(
            title: 'Rotate2',
            onPress: () => RouteUtil.push(context,
                page: BoxRotationAnimation(
                  title: 'Rotate2',
                )),
          ),
          AnimatedListItem(
            title: 'Scale',
            onPress: () => RouteUtil.push(context,
                page: BoxScaleAnimation(
                  title: 'BoxScaleAnimation',
                )),
          ),
          AnimatedListItem(
            title: 'Rotate',
            onPress: () => RouteUtil.push(context, page: AnimatedPage()),
          ),
          AnimatedListItem(
            title: 'Opacity2',
            onPress: () => RouteUtil.push(context,
                page: BoxOpacityAnimation(
                  title: 'Opacity2',
                )),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class AnimatedListItem extends StatelessWidget {
  final String title;
  final Function onPress;

  const AnimatedListItem({
    Key key,
    this.title,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 45,
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(
              width: 1,
              color: CustomStyle.dividerColor,
            ))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(title ?? ''),
            Icon(Icons.arrow_right),
          ],
        ),
      ),
    );
  }
}
