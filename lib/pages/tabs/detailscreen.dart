import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:alqurann/model/ayah_model.dart';
import 'package:alqurann/model/surah_model.dart';
import 'package:alqurann/theme.dart';
import 'package:alqurann/viewmodel/ayahviewmodel.dart';
import 'package:just_audio/just_audio.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = 'detail_screen';
  final String id_surah;

  DetailScreen({super.key, required this.id_surah});

  @override
  Widget build(BuildContext context) {
    final AudioPlayer _player = AudioPlayer();
    final AyahViewModel _viewModel = AyahViewModel();
    final _ayahModelFuture = AyahViewModel().getListAyah(id_surah);
    return Scaffold(
        appBar: AppBar(
          actions: [
            FutureBuilder(
                future: _viewModel.getListAyah(id_surah),
                builder: (context, snapshot) {
                  return IconButton(
                      onPressed: () async {
                        await _player.setAudioSource(AudioSource.uri(
                            Uri.parse(snapshot.data!.audio.toString())));

                        // print(snapshot.data!.audio.toString());
                      },
                      icon: Icon(Icons.play_arrow));
                }),
            FutureBuilder(
                future: _viewModel.getListAyah(id_surah),
                builder: (context, snapshot) {
                  return IconButton(
                      onPressed: () async {
                        await _player.pause();
                        // print(snapshot.data!.audio.toString());
                      },
                      icon: Icon(Icons.pause));
                })
          ],
          centerTitle: true,
          backgroundColor: secondary,
          title: FutureBuilder(
            future: _ayahModelFuture,
            builder: (context, AsyncSnapshot<AyahModel> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text(
                    'Loading...'); // Placeholder text ketika data masih dimuat
              } else if (snapshot.hasData) {
                final ayatModel = snapshot.data!;
                return Text(ayatModel.namaLatin.toString(),
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      color: primary,
                    )); // Tampilkan namaLatin pada AppBar
              } else if (!snapshot.hasData) {
                return Text(
                    'Detail Screen'); // Default text jika tidak ada data
              } else {
                return Text("kosong");
              }
            },
          ),
        ),
        backgroundColor: background,
        body: FutureBuilder(
            future: _viewModel.getListAyah(id_surah),
            builder: (context, AsyncSnapshot<AyahModel> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (snapshot.hasData) {
                return ListView.separated(
                    itemBuilder: (context, index) => _surah(
                        context: context,
                        ayat: snapshot.data!.ayat!.elementAt(index)),
                    separatorBuilder: (context, index) =>
                        Divider(color: Colors.grey.withOpacity(0.1), height: 1),
                    itemCount: snapshot.data!.ayat!.length);
              } else {
                return const Center(
                  child: Text("No Data Available"),
                );
              }
            }));
  }
}

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
                      ayat.nomor.toString(),
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
                      ayat.ar.toString(),
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
                  fontSize: 14)),
          SizedBox(
            height: 20,
          ),
          Text(ayat.idn.toString(),
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontSize: 14)),
        ],
      ),
    );
