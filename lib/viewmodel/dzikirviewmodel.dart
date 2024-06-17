import 'package:alqurann/model/dzikir_model.dart';
import 'package:alqurann/repository/quran_repository.dart';

class dzikirViewModel {
  final QuranRepository _repository = QuranRepository();
  Future<DzikirDetail> getListDzikir(String id_dzikir) async =>
      await _repository.getListDzikir(id_dzikir);
}
