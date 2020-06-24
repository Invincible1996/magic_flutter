/*
 * @author kevin
 * @date 2020/6/23 4:40 PM
 * @Description: flutter
*/
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:magic_flutter/components/shop_cart_item.dart';
import 'package:magic_flutter/model/cart_model.dart';
import 'package:magic_flutter/provider/shop_cart_provider.dart';
import 'package:provider/provider.dart';

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
    CartModel(title: '磨砺的不止锋芒，还有灵魂', isSelect: true),
  ];

  List<CartModel> newList = [];

  @override
  initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<ShopCartProvider>(context, listen: false).initCartList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ShopCartProvider>(builder: (context, model, child) {
      return Scaffold(
        appBar: AppBar(title: Text('ShopCart')),
        body: Container(
          child: ListView.builder(
              itemCount: model.cartList.length,
              itemBuilder: (context, index) => ShopCartItem(
                  onItemSelect: (checked, value) =>
                      model.onItemSelect(checked,index, value),
                  cartItem: model.cartList[index])),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 56,
            padding: EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Checkbox(
                    value: model.selectCartList.length == model.cartList.length,
                    onChanged: (checked) {
                      if (checked) {
                        model.selectAll();
                      } else {
                        model.unSelectAll();
                      }
                      debugPrint(
                          '74---shop_cart_page-----${model.selectCartList.length}');
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
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
