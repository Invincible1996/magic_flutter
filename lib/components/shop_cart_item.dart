/*
 * @author kevin
 * @date 2020/6/23 4:54 PM
 * @Description: flutter
*/

import 'package:flutter/material.dart';
import 'package:magic_flutter/model/cart_model.dart';

class ShopCartItem extends StatefulWidget {
  final CartModel cartItem;
  final Function onItemSelect;

  const ShopCartItem({Key key, this.cartItem, this.onItemSelect})
      : super(key: key);

  @override
  _ShopCartItemState createState() => _ShopCartItemState();
}

class _ShopCartItemState extends State<ShopCartItem> {
  bool _isSelect = false;
  CartModel cartModel;

  @override
  initState() {
    super.initState();
    _isSelect = widget.cartItem.isSelect;
//    cartModel = widget.cartItem;
  }

  @override
  void didUpdateWidget(ShopCartItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    debugPrint('35---${widget.cartItem.title}-----${widget.cartItem.isSelect}');
    setState(() {
      cartModel = widget.cartItem;
      _isSelect = widget.cartItem.isSelect;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: <Widget>[
          Checkbox(
              value: widget.cartItem.isSelect,
              onChanged: (value) {
                widget.onItemSelect(value, widget.cartItem);
              }),
          Text('${widget.cartItem.title}'),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
