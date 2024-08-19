import 'dart:convert';
import 'package:alqurann/model/adzan_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Untuk membaca file JSON
import 'package:intl/intl.dart';

class AdzanViewModel {
  final DateTime dateTime;
  final String name;

  AdzanViewModel({
    required this.dateTime,
    required this.name,
  });

  factory AdzanViewModel.fromJson(Map<String, dynamic> json) {
    return AdzanViewModel(
      dateTime: DateTime.parse(json['dateTime']),
      name: json['name'],
    );
  }

  Future<List<JadwalAdzan>> getListAdzan() async {
    final String response = await rootBundle.loadString('assets/data/list-jadwal-adzan.json');
    final List<dynamic> data = json.decode(response);
    return data.map((item) => JadwalAdzan.fromJson(item)).toList();
  }
formatAdzanTime(DateTime dateTime){}
  
}

class Adzan extends ChangeNotifier {
  List<AdzanViewModel> _adzanList = [];

  List<AdzanViewModel> get adzanList => _adzanList;

  Future<void> fetchAdzanData() async {
    // Membaca data dari file JSON
    final String response = await rootBundle.loadString('data/adzan_data.json');
    final List<dynamic> data = json.decode(response);

    _adzanList = data.map((item) => AdzanViewModel.fromJson(item)).toList();
    notifyListeners();
  }

  AdzanViewModel? getNextAdzan() {
    final now = DateTime.now();
    return _adzanList.firstWhere(
      (adzan) => adzan.dateTime.isAfter(now),
      orElse: () => _adzanList.last,
    );
  }

  void addAdzan(AdzanViewModel adzan) {
    _adzanList.add(adzan);
    _adzanList.sort((a, b) => a.dateTime.compareTo(b.dateTime));
    notifyListeners();
  }

  void updateAdzan(AdzanViewModel updatedAdzan) {
    int index =
        _adzanList.indexWhere((adzan) => adzan.name == updatedAdzan.name);
    if (index != -1) {
      _adzanList[index] = updatedAdzan;
      _adzanList.sort((a, b) => a.dateTime.compareTo(b.dateTime));
      notifyListeners();
    }
  }

  void removeAdzan(String name) {
    _adzanList.removeWhere((adzan) => adzan.name == name);
    notifyListeners();
  }

  String formatAdzanTime(DateTime dateTime) {
    return DateFormat('HH:mm').format(dateTime);
  }
}