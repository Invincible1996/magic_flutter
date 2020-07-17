/*
 * @author kevin
 * @date 2020/6/23 1:47 PM
 * @Description: flutter
*/

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RouteUtil {
  ///push page
  static push(BuildContext context, {page}) {
    Get.to(page);
//    Navigator.of(context).push(CupertinoPageRoute(builder: (_) => page));
  }

  /// pop page
  static pop(BuildContext context) {
    Get.back();
//    Navigator.of(context).pop();
  }

  /// replace page
  static replace(BuildContext context, {page}) {
    Get.offAll(page);
//    Navigator.pushAndRemoveUntil(
//        context,
//        CupertinoPageRoute<void>(builder: (ctx) => page),
//        (Route<dynamic> routes) => false);
  }
}
