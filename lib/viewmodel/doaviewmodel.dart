import 'package:alqurann/model/doa_model.dart';
import 'package:alqurann/repository/quran_repository.dart';

class DoaViewModel {
  final QuranRepository _repository = QuranRepository();
  Future<List<doa>> getListDoa() async =>
    await _repository.getListDoa();
  
  
}