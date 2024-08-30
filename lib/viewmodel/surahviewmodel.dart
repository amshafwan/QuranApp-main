
import 'package:alqurann/model/surah_model.dart';
import 'package:alqurann/repository/quran_repository.dart';

class SurahViewModel {
  final QuranRepository _repository = QuranRepository(); 

  // Fungsi untuk mengambil daftar Surah dari repository.
  Future<List<surah>> getListSurah() async => await _repository
      .getListSurah(); 
}
