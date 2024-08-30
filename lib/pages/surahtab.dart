import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:alqurann/model/surah_model.dart';
import 'package:alqurann/pages/tabs/detailscreen.dart';
import 'package:alqurann/viewmodel/surahviewmodel.dart';

class tabSurah extends StatelessWidget {
  const tabSurah({super.key});

  @override
  Widget build(BuildContext context) {

    // Membuat objek dari kelas SurahViewModel untuk mengambil data surat
    final SurahViewModel _viewModel = SurahViewModel(); 

    return FutureBuilder<List<surah>>(
        future: _viewModel.getListSurah(), // Mendapatkan daftar surat dari ViewModel
        builder: (context, snapshot) {
          if (!snapshot.hasData) { // Menampilkan "No Data" kalau data belum tersedia
            return const Center(
              child: Text("No Data"),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return const Center(
              child: Text("Error loading data"),
            );
          }

          // Tampilkan daftar surat jika data sudah tersedia
          return ListView.separated(
              itemBuilder: (context, index) => _itemList(
                    context: context,
                    surah: snapshot.data!.elementAt(index),
                  ),
              separatorBuilder: (context, index) =>
                  Divider(color: Colors.grey.withOpacity(0.1), height: 1),
              itemCount: snapshot.data!.length);
        });
  }

  // Widget untuk menampilkan item daftar surah
  Widget _itemList({
    required BuildContext context,
    required surah surah,
  }) =>
      InkWell(
        onTap: () {
          Navigator.pushNamed(context, DetailScreen.routeName,
              arguments: surah.nomor.toString());
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  SvgPicture.asset('assets/svg/nomor_surah.svg'),
                  SizedBox(
                    height: 36,
                    width: 36,
                    child: Center(
                      child: Text(
                        surah.nomor.toString(),
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      surah.nama_latin,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.black),
                    ),
                    Text(
                      "${surah.tempat_turun}-${surah.jumlah_ayat}",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Text(
                surah.nama,
                style: GoogleFonts.poppins(
                    fontSize: 18, fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ),
      );
}
