/*
 * @author kevin
 * @date 2020/7/15 3:39 下午
 * @Description: flutter
*/

import 'package:meta/meta.dart';

@immutable
// ignore: must_be_immutable
class CountState {
  int _count;

  get count => _count;

  CountState.initState() : _count = 0;

  CountState(this._count);
}
