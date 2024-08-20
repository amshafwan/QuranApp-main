import 'package:alqurann/model/adzan_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:alqurann/repository/quran_repository.dart'; // Import repository

class AdzanViewModel with ChangeNotifier {
  final QuranRepository _repository;
  List<JadwalAdzan> _adzanList = []; // Menyimpan daftar jadwal adzan

  AdzanViewModel({required QuranRepository repository})
      : _repository = repository;

  List<JadwalAdzan> get adzanList => _adzanList;

  // Mengambil data dari API menggunakan QuranRepository
  Future<void> fetchAdzanData() async {
    try {
      final response =
          await _repository.getListAdzan(); // Panggil API melalui repository
      _adzanList = response; // Isi daftar jadwal adzan
      notifyListeners(); // Pemberitahuan bahwa data telah diperbarui
    } catch (e) {
      print('Error fetching data: $e');
      _adzanList = []; // Kosongkan list jika terjadi error
      notifyListeners();
    }
  }

  // Mendapatkan jadwal adzan berikutnya
  JadwalAdzan? getNextAdzan() {
    final now = DateTime.now();
    for (var adzan in _adzanList) {
      // Mengonversi waktu adzan dari string ke DateTime
      DateTime? shubuhTime = _parseTime(adzan.shubuh);
      if (shubuhTime != null && shubuhTime.isAfter(now)) {
        return adzan;
      }
    }
    return _adzanList.isNotEmpty ? _adzanList.last : null;
  }

  // Menambahkan jadwal adzan baru
  void addAdzan(JadwalAdzan adzan) {
    _adzanList.add(adzan);
    _adzanList.sort((a, b) {
      DateTime? aTime = _parseTime(a.shubuh);
      DateTime? bTime = _parseTime(b.shubuh);
      return (aTime ?? DateTime.now()).compareTo(bTime ?? DateTime.now());
    });
    notifyListeners();
  }

  // Memperbarui jadwal adzan yang ada
  void updateAdzan(JadwalAdzan updatedAdzan) {
    int index =
        _adzanList.indexWhere((adzan) => adzan.tanggal == updatedAdzan.tanggal);
    if (index != -1) {
      _adzanList[index] = updatedAdzan;
      _adzanList.sort((a, b) {
        DateTime? aTime = _parseTime(a.shubuh);
        DateTime? bTime = _parseTime(b.shubuh);
        return (aTime ?? DateTime.now()).compareTo(bTime ?? DateTime.now());
      });
      notifyListeners();
    }
  }

  // Menghapus jadwal adzan berdasarkan tanggal
  void removeAdzan(String tanggal) {
    _adzanList.removeWhere((adzan) => adzan.tanggal == tanggal);
    notifyListeners();
  }

  // Memformat waktu adzan menjadi string dalam format HH:mm
  String formatAdzanTime(DateTime dateTime) {
    return DateFormat('HH:mm').format(dateTime);
  }

  // Mengonversi string waktu adzan menjadi DateTime
  DateTime? _parseTime(String? time) {
    if (time == null) return null;
    try {
      return DateFormat('HH:mm').parse(time);
    } catch (e) {
      print('Error parsing time: $e');
      return null;
    }
  }
}
