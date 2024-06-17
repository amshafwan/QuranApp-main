import 'dart:convert';

List<sholat> sholatFromjson(String str) =>
    List<sholat>.from(json.decode(str).map((x) => sholat.fromJson(x)));

class sholat {
  String? title;
  String? arabic;
  String? latin;
  String? translation;
  String? fawaid;
  String? notes;
  String? source;

  sholat(
      {this.title,
      this.arabic,
      this.latin,
      this.translation,
      this.fawaid,
      this.notes,
      this.source});

  sholat.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    arabic = json['arabic'];
    latin = json['latin'];
    translation = json['translation'];
    fawaid = json['fawaid'];
    notes = json['notes'];
    source = json['source'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['arabic'] = this.arabic;
    data['latin'] = this.latin;
    data['translation'] = this.translation;
    data['fawaid'] = this.fawaid;
    data['notes'] = this.notes;
    data['source'] = this.source;
    return data;
  }
}
