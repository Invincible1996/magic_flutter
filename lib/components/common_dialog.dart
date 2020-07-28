/*
 * @author wen
 * @date 2020/2/7
 * @Description: dart file
*/

import 'package:flutter/material.dart';

class CommonDialog extends Dialog {
  final Widget child;
  final Function onDismiss;

  CommonDialog({
    this.child,
    this.onDismiss,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return Future.value(true);
      },
      child: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Material(type: MaterialType.transparency, child: child)),
    );
  }
}
