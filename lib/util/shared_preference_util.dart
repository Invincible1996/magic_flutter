/*
 * @author wen
 * @date 2019-12-10
 * @Description: 
*/

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceUtil {
  static saveData(String key, String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(key, value);
  }

  static Future getData(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(key);
  }

  static removeData(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove(key);
  }
}
