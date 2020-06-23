/*
 * @author kevin
 * @date 2020/6/23 5:46 PM
 * @Description: flutter
*/

class CartModel {
  bool isSelect;
  String title;

  CartModel({this.isSelect, this.title});

  CartModel.fromJson(Map<String, dynamic> json) {
    isSelect = json['isSelect'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSelect'] = this.isSelect;
    data['title'] = this.title;
    return data;
  }
}
