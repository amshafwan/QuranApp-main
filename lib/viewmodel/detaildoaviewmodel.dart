import 'package:alqurann/model/doa_model.dart';
import 'package:alqurann/repository/quran_repository.dart';
import 'package:alqurann/viewmodel/doaviewmodel.dart';

class detailDoaViewModel {
  final _repository = QuranRepository();
  Future<List<doa>> getListDetailDoa(String id_doa) async {
    try {
      final doa = await _repository.getListDetailDoa(id_doa);
      return doa;
    } catch (e) {
      print("error: $e");
      rethrow;
    }
  }
}
