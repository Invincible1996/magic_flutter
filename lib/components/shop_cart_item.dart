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
  CartModel cartModel;

  @override
  initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(ShopCartItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      cartModel = widget.cartItem;
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
          Image.network(
            'https://img.moegirl.org/common/f/f7/%E7%A0%B4%E7%81%AD%E5%88%80%E9%94%8B%E9%93%A0.jpg',
            width: 120,
            height: 120,
          ),
          SizedBox(width: 8,),
          Expanded(
              flex: 1,
              child: Text(
                '${widget.cartItem.title}',
                overflow: TextOverflow.clip,
              )),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
