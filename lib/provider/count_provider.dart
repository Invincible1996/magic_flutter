/*
 * @author kevin
 * @date 2020/7/17 11:45 上午
 * @Description: flutter
*/
import 'package:flutter/foundation.dart';

class CounterProvider with ChangeNotifier {
  int count = 0;

  void increment() {
    count++;
    notifyListeners();
  }
}
