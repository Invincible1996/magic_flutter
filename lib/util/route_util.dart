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
    Get.to(page,duration: Duration(milliseconds: 350));
  }

  /// pop page
  static pop(BuildContext context) {
    Get.back();
  }

  /// replace page
  static replace(BuildContext context, {page}) {
    Get.offAll(page);
  }
}
