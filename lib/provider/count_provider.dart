/*
 * @author kevin
 * @date 2020/7/17 11:45 上午
 * @Description: flutter
*/
import 'package:flutter/foundation.dart';

class CounterProvider with ChangeNotifier {
  int count = 0;
  int count1 = 0;

  void increment() {
    count++;
    notifyListeners();
  }

  void increment1() {
    count1++;
    notifyListeners();
  }

  Future getValue() async {
    return 22;
  }
}
