import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:alqurann/model/ayah_model.dart';
import 'package:alqurann/model/surah_model.dart';
import 'package:alqurann/theme.dart';
import 'package:alqurann/viewmodel/ayahviewmodel.dart';
import 'package:just_audio/just_audio.dart';

// Ini adalah kelas DetailScreen, yang menampilkan detail dari sebuah surah.
class DetailScreen extends StatelessWidget {
  static const routeName = 'detail_screen'; // Ini adalah nama rute untuk navigasi.
  final String id_surah; // ID surah yang akan ditampilkan.

  // Constructor kelas DetailScreen, perlu id_surah saat dibuat.
  DetailScreen({super.key, required this.id_surah});

  @override
  Widget build(BuildContext context) {
    final AudioPlayer _player =
        AudioPlayer(); // Pemutar audio untuk memainkan ayat.
    final AyahViewModel _viewModel =
        AyahViewModel(); // ViewModel untuk mendapatkan data ayat.
    final _ayahModelFuture = _viewModel
        .getListAyah(id_surah); // Mengambil data ayat berdasarkan id_surah.

    return Scaffold(
        appBar: AppBar(
          actions: [
            // Tombol play untuk memutar audio.
            FutureBuilder(
                future: _viewModel.getListAyah(id_surah),
                builder: (context, snapshot) {
                  return IconButton(
                      onPressed: () async {
                        await _player.setAudioSource(AudioSource.uri(
                            Uri.parse(snapshot.data!.audio.toString())));
                        // Mengatur sumber audio untuk diputar.
                      },
                      icon: Icon(Icons.play_arrow));
                }),
            // Tombol pause untuk menghentikan audio.
            FutureBuilder(
                future: _viewModel.getListAyah(id_surah),
                builder: (context, snapshot) {
                  return IconButton(
                      onPressed: () async {
                        await _player
                            .pause(); // Pause audio saat tombol ditekan.
                      },
                      icon: Icon(Icons.pause));
                })
          ],
          centerTitle: true,
          backgroundColor: secondary, // Mengatur warna latar belakang AppBar.
          title: FutureBuilder(
            future: _ayahModelFuture,
            builder: (context, AsyncSnapshot<AyahModel> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text('Loading...'); // Teks saat data masih dimuat.
              } else if (snapshot.hasData) {
                final ayatModel = snapshot.data!;
                return Text(ayatModel.namaLatin.toString(),
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      color: primary,
                    )); // Menampilkan nama surah dalam Latin.
              } else if (!snapshot.hasData) {
                return Text(
                    'Detail Screen'); // Teks default jika tidak ada data.
              } else {
                return Text("kosong");
              }
            },
          ),
        ),
        backgroundColor: background, // Mengatur warna latar belakang.
        body: FutureBuilder(
            future: _viewModel.getListAyah(id_surah),
            builder: (context, AsyncSnapshot<AyahModel> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child:
                      CircularProgressIndicator(), // Menampilkan loading indicator.
                );
              } else if (snapshot.hasError) {
                return Center(
                    child: Text(
                        'Error: ${snapshot.error}')); // Menampilkan pesan error.
              } else if (snapshot.hasData) {
                return ListView.separated(
                    itemBuilder: (context, index) => _surah(
                        context: context,
                        ayat: snapshot.data!.ayat!.elementAt(index)),
                    separatorBuilder: (context, index) =>
                        Divider(color: Colors.grey.withOpacity(0.1), height: 1),
                    itemCount: snapshot
                        .data!.ayat!.length); // Menampilkan daftar ayat.
              } else {
                return const Center(
                  child: Text("No Data Available"), // Teks saat tidak ada data.
                );
              }
            }));
  }
}

// Widget untuk menampilkan satu ayat di dalam list.
Widget _surah({required BuildContext context, required Ayat ayat}) => Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Stack(
                children: [
                  SvgPicture.asset(
                    'assets/svg/nomor_surah.svg',
                    colorFilter: ColorFilter.mode(primary, BlendMode.srcIn),
                  ),
                  SizedBox(
                    height: 36,
                    width: 36,
                    child: Center(
                        child: Text(
                      ayat.nomor.toString(), // Menampilkan nomor ayat.
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500, color: Colors.black),
                    )),
                  )
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      ayat.ar.toString(), // Menampilkan teks Arab dari ayat.
                      textAlign: TextAlign.end,
                      style: GoogleFonts.amiriQuran(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 20),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(ayat.tr.toString(),
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontSize: 14)), // Menampilkan terjemahan ayat.
          SizedBox(
            height: 20,
          ),
          Text(ayat.idn.toString(),
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontSize: 14)), // Menampilkan teks Indonesia dari ayat.
        ],
      ),
    );
