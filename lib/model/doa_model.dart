import 'dart:convert';

List<doa> doaFromjson(String str) =>
    List<doa>.from(json.decode(str).map((x) => doa.fromJson(x)));

class doa {
  String? title;
  String? arabic;
  String? latin;
  String? translation;
  String? fawaid;
  String? source;

  doa(
      {this.title,
      this.arabic,
      this.latin,
      this.translation,
      this.fawaid,
      this.source});

  doa.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    arabic = json['arabic'];
    latin = json['latin'];
    translation = json['translation'];
    fawaid = json['fawaid'];

    source = json['source'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['arabic'] = this.arabic;
    data['latin'] = this.latin;
    data['translation'] = this.translation;
    data['fawaid'] = this.fawaid;

    data['source'] = this.source;
    return data;
  }
}
