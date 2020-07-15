/*
 * @author kevin
 * @date 2020/7/15 3:41 下午
 * @Description: flutter
*/

import 'package:magic_flutter/redux/action/action.dart';

import '../count_state.dart';

CountState reducer(CountState state, action) {
  //匹配Action
  if (action == MActions.increment) {
    return CountState(state.count + 1);
  }
  return state;
}
