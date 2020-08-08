/*
 * @Author: kevin
 * @Date: 2020-08-08 13:29:09
 * @LastEditTime: 2020-08-08 13:41:05
 * @Description: ChoiceModel
 */
class ChoiceModel {
  String chooice;
  String value;
  bool isCanSelect;
  bool isRightAnswer;
  bool isSeclect;

  ChoiceModel(
      {this.chooice,
      this.value,
      this.isCanSelect,
      this.isRightAnswer,
      this.isSeclect});

  ChoiceModel.fromJson(Map<String, dynamic> json) {
    chooice = json['chooice'];
    value = json['value'];
    isCanSelect = json['isCanSelect'];
    isRightAnswer = json['isRightAnswer'];
    isSeclect = json['isSeclect'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['chooice'] = this.chooice;
    data['value'] = this.value;
    data['isCanSelect'] = this.isCanSelect;
    data['isRightAnswer'] = this.isRightAnswer;
    data['isSeclect'] = this.isSeclect;
    return data;
  }
}
