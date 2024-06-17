import 'dart:convert';

List<surah> surahFromJson(String str) =>
    List<surah>.from(json.decode(str).map((x) => surah.fromJson(x)));

class surah {
  int nomor;
  String nama;
  String nama_latin;
  int jumlah_ayat;
  String tempat_turun;
  String arti;
  String deskripsi;
  String audio;

  surah({
    required this.nomor,
    required this.nama,
    required this.nama_latin,
    required this.jumlah_ayat,
    required this.tempat_turun,
    required this.arti,
    required this.deskripsi,
    required this.audio,
  });

  factory surah.fromJson(Map<String, dynamic> json) => surah(
      nomor: json['nomor'],
      nama: json['nama'],
      nama_latin: json['nama_latin'],
      jumlah_ayat: json['jumlah_ayat'],
      tempat_turun: json['tempat_turun'].toUpperCase(),
      arti: json['arti'],
      deskripsi: json['deskripsi'],
      audio: json['audio']);
}
