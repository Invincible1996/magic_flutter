/*
 * @Author: kevin
 * @Date: 2020-06-24 10:48:25
 * @LastEditTime: 2020-07-16 11:37:46
 * @Description: flutter
 */

import 'package:flutter/foundation.dart';
import 'package:magic_flutter/model/cart_model.dart';

class ShopCartProvider extends ChangeNotifier {
  List<CartModel> cartList = [];
  List<CartModel> selectCartList = [];

  initCartList() {
    selectCartList.clear();
    cartList = [
      CartModel(title: '长城，让我忘记自己孤身一人', isSelect: false),
      CartModel(title: '比任何对手都强，乃人生最大的烦恼', isSelect: false),
      CartModel(title: '以绝望挥剑着逝者为铠。', isSelect: false),
      CartModel(title: '一个人可以被毁灭，但绝不可以被打败', isSelect: false),
      CartModel(title: '磨砺的不止锋芒，还有灵魂', isSelect: false),
    ];
    notifyListeners();
  }

  removeProduct(index) {
    selectCartList.removeAt(index);
    notifyListeners();
  }

  addProduct(CartModel cart) {
    selectCartList.add(cart);
    notifyListeners();
  }

  clear() {
    selectCartList.clear();
    notifyListeners();
  }

  onItemSelect(checked, index, value) {
    if (checked) {
      selectCartList.add(value);
    } else {
      selectCartList.remove(value);
    }
    cartList[index].isSelect = checked;
    notifyListeners();
  }

  selectAll() {
    print('object');
    selectCartList.clear();
    cartList.forEach((element) {
      element.isSelect = true;
    });
    selectCartList.addAll(cartList);
    notifyListeners();
  }

  unSelectAll() {
    cartList.forEach((element) {
      element.isSelect = false;
    });
    selectCartList.clear();
    notifyListeners();
  }
}
