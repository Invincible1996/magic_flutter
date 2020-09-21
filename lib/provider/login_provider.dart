/*
 * @author kevin
 * @date 2020/8/26 1:26 PM
 * @Description: flutter
*/

import 'package:flutter/foundation.dart';
import 'package:magic_flutter/util/shared_preference_util.dart';

class LoginProvider with ChangeNotifier {
  bool isLogin = false;

  initUser() async {
    String token = await SharedPreferenceUtil.getData('token');
    isLogin = token != null;
    notifyListeners();
  }

  login() {
    SharedPreferenceUtil.saveData('token', 'token');
    isLogin = true;
    notifyListeners();
  }
}
