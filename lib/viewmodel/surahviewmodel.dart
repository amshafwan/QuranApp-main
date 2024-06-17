
import 'package:alqurann/model/surah_model.dart';
import 'package:alqurann/repository/quran_repository.dart';

class SurahViewModel {
  final QuranRepository _repository = QuranRepository();

  Future<List<surah>> getListSurah() async => /*sekaligus bawa return*/
      await _repository.getListSurah();
}
