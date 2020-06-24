/*
 * @author kevin
 * @date 2020/6/10 4:37 PM
 * @Description: flutter
*/

class HomeModel {
  int typeId;
  List<TypeList> typeList;

  HomeModel({this.typeId, this.typeList});

  HomeModel.fromJson(Map<String, dynamic> json) {
    typeId = json['typeId'];
    if (json['typeList'] != null) {
      typeList = new List<TypeList>();
      json['typeList'].forEach((v) {
        typeList.add(new TypeList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['typeId'] = this.typeId;
    if (this.typeList != null) {
      data['typeList'] = this.typeList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TypeList {
  int id;
  String name;

  TypeList({this.id, this.name});

  TypeList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
