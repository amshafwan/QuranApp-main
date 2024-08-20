import 'dart:convert';
import 'package:alqurann/model/adzan_model.dart';
import 'package:alqurann/model/doa_model.dart';
import 'package:alqurann/model/dzikir_mewing.dart';
import 'package:alqurann/model/dzikir_model.dart';
import 'package:alqurann/model/dzikirslht_model.dart';
import 'package:alqurann/viewmodel/doaviewmodel.dart';
import 'package:flutter/services.dart';
import 'package:alqurann/model/ayah_model.dart';
import 'package:alqurann/model/surah_model.dart';
import 'package:http/http.dart' as http;

class QuranRepository {
  Future<List<surah>> getListSurah() async {
    String data = await rootBundle.loadString('assets/data/list-surah.json'); // Memuat data surah dari file JSON lokal.
    return surahFromJson(data); // Mengembalikan daftar surah yang didekode dari JSON.
  }

  Future<List<doa>> getListDoa() async {
    String doa = await rootBundle.loadString("assets/data/list-doa.json");
    return doaFromjson(doa);
  }

  Future<List<doa>> getListDetailDoa(String id_doa) async {
    String detail = await rootBundle.loadString("assets/data/list-doa.json");
    return doaFromjson(detail);
  }
  
  

  Future<DzikirDetail> getListDzikir(String id_dzikir) async {
    String data = await rootBundle.loadString('assets/data/list-dzikir.json');

    final List<dynamic> mewingDzikir = jsonDecode(data);
    Map<String, dynamic>? detailData = mewingDzikir.firstWhere((element) => element['id']==id_dzikir,orElse: () => null,);  // Mencari data dzikir yang sesuai dengan ID yang diberikan.

    if(detailData != null ){
      return DzikirDetail.fromJson(detailData);
    }else{
      throw Exception("eror bang");
    }
  }

  Future<List<DzikirMewing>> getListMewing() async {
    String data =
        await rootBundle.loadString('assets/data/list-dzikir-detail.json');
    return mewingFromjson(data);
  }

  Future<AyahModel> getListAyah(String id_surah) async {
    String url = 'https://equran.id/api/surat/$id_surah';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return AyahModel.fromJson(body);
    }
    throw Exception("error");
  }

  Future<List<JadwalAdzan>> getListAdzan() async {
    String url =
        'http://api.aladhan.com/v1/calendarByCity/2024/8?city=Balikpapan&country=Indonesia&method=2';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      List<dynamic> data = body['data']; // Ambil data dari field 'data'

      return data.map((item) {
        return JadwalAdzan.fromJson(
            item); // Gunakan factory constructor untuk membuat objek dari JSON
      }).toList();
    } else {
      throw Exception("Failed to load adzan data");
    }
  }
}
