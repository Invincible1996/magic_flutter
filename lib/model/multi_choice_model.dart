/*
 * @Author: kevin
 * @Date: 2020-08-11 11:48:39
 * @LastEditTime: 2020-08-11 14:41:18
 * @Description: flutter
 */
class MultiChoiceModel {
  int id;
  String question;
  List<String> rightAnswer;
  List<Options> options;

  MultiChoiceModel({this.id, this.question, this.rightAnswer, this.options});

  MultiChoiceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    rightAnswer = json['rightAnswer'].cast<String>();
    if (json['options'] != null) {
      options = new List<Options>();
      json['options'].forEach((v) {
        options.add(new Options.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    data['rightAnswer'] = this.rightAnswer;
    if (this.options != null) {
      data['options'] = this.options.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Options {
  String choice;
  String value;

  Options({this.choice, this.value});

  Options.fromJson(Map<String, dynamic> json) {
    choice = json['choice'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['choice'] = this.choice;
    data['value'] = this.value;
    return data;
  }
}
