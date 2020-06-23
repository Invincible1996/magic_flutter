/*
 * @author kevin
 * @date 2020/6/23 4:40 PM
 * @Description: flutter
*/
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:magic_flutter/components/shop_cart_item.dart';
import 'package:magic_flutter/model/cart_model.dart';

class ShopCartPage extends StatefulWidget {
  @override
  _ShopCartPageState createState() => _ShopCartPageState();
}

class _ShopCartPageState extends State<ShopCartPage> {
  bool _isSelectAll = false;
  List<CartModel> cartList = <CartModel>[
    CartModel(title: '长城，让我忘记自己孤身一人', isSelect: false),
    CartModel(title: '比任何对手都强，乃人生最大的烦恼', isSelect: false),
    CartModel(title: '以绝望挥剑着逝者为铠。', isSelect: false),
    CartModel(title: '一个人可以被毁灭，但绝不可以被打败', isSelect: false),
    CartModel(title: '饮血的刃，越发空虚，无限接近死亡，更能醒悟生存的真谛', isSelect: false),
    CartModel(title: '磨砺的不止锋芒，还有灵魂', isSelect: true),
  ];

  List<CartModel> newList = [];

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ShopCart')),
      body: Container(
        child: ListView.builder(
            itemCount: cartList.length,
            itemBuilder: (context, index) => ShopCartItem(
                onItemSelect: (status, value) {
                  debugPrint('42---shop_cart_page-----$value');
                  debugPrint('42---shop_cart_page-----$status');
                  if (status) {
                    newList.add(value);
                  } else {
                    newList.remove(value);
                  }
                  setState(() {
                    _isSelectAll = newList.length == cartList.length;
                  });
                },
                cartItem: cartList[index])),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 56,
          padding: EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              Checkbox(
                  value: _isSelectAll,
                  onChanged: (value) {
                    setState(() {
                      _isSelectAll = value;
                    });
                  }),
//              Icon(Icons.check_box_outline_blank),
              SizedBox(
                width: 10,
              ),
              Expanded(child: Text('总计：¥1230.00')),
              RaisedButton(
                shape: StadiumBorder(),
                onPressed: () {},
                child: Text(
                  '立即下单',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
