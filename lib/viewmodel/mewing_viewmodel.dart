import 'package:alqurann/model/dzikir_mewing.dart';
import 'package:alqurann/repository/quran_repository.dart';

class MewingViewModel {
  final QuranRepository _repository = QuranRepository();

  Future<List<DzikirMewing>> getListMewing() async => await _repository.getListMewing();
}