import 'dart:convert';

List<DzikirMewing> mewingFromjson(String str) =>
    List<DzikirMewing>.from(json.decode(str).map((x) => DzikirMewing.fromJson(x)));

class DzikirMewing {
  int? id;
  String? title;

  DzikirMewing({this.id, this.title});

  DzikirMewing.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}
