import 'package:alqurann/model/doa_model.dart';
import 'package:alqurann/model/dzikir_model.dart';
import 'package:alqurann/theme.dart';
import 'package:alqurann/viewmodel/detaildoaviewmodel.dart';
import 'package:alqurann/viewmodel/doaviewmodel.dart';
import 'package:alqurann/viewmodel/dzikirviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Ini adalah kelas detaildzikir yang menampilkan detail dzikir.
class detaildzikir extends StatelessWidget {
  static const routeName = 'detail_dzikir'; // Nama rute untuk halaman ini.
  final String id_dzikir; // ID dzikir yang akan ditampilkan.

  // Constructor untuk menerima ID dzikir.
  const detaildzikir({super.key, required this.id_dzikir});

  @override
  Widget build(BuildContext context) {
    final dzikirViewModel _viewModel =
        dzikirViewModel(); // Membuat instance ViewModel untuk mendapatkan data dzikir.

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Dzikir",
          style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black), // Mengatur gaya teks judul.
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Tombol kembali.
          onPressed: () => Navigator.pop(
              context), // Aksi untuk kembali ke halaman sebelumnya.
        ),
      ),
      body: FutureBuilder(
        future: _viewModel.getListDzikir(
            id_dzikir), // Mendapatkan data dzikir berdasarkan ID.
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
                child:
                    Text("no data")); // Menampilkan teks jika data tidak ada.
          } else {
            return ListView.separated(
              itemBuilder: (context, index) => _ListDoa(
                  context: context,
                  dzikir: snapshot.data!.dzikir!.elementAt(
                      index)), // Menampilkan setiap dzikir dalam list.
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey
                    .withOpacity(0.1), // Garis pemisah antar item dzikir.
                height: 1,
              ),
              itemCount: snapshot
                  .data!.dzikir!.length, // Menentukan jumlah item dalam list.
            );
          }
        },
      ),
    );
  }
}

// Widget untuk menampilkan satu item dzikir dalam list.
Widget _ListDoa({required BuildContext context, required Dzikir dzikir}) {
  return Container(
    padding: EdgeInsets.all(15), // Memberikan padding di sekitar konten.
    child: Column(
      crossAxisAlignment:
          CrossAxisAlignment.start, // Konten disejajarkan ke kiri.
      children: [
        Text(
          dzikir.title?.toUpperCase() ??
              '', // Menampilkan judul dzikir dengan huruf kapital.
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: primary), // Mengatur gaya teks judul dzikir.
        ),
        SizedBox(
          height: 40,
        ),
        Row(
          children: [
            SizedBox(
              height: 40,
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.end, // Teks Arab disejajarkan ke kanan.
                children: [
                  Text(
                    dzikir.arabic ?? '', // Menampilkan teks Arab dzikir.
                    textAlign: TextAlign.end,
                    style: GoogleFonts.amiriQuran(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 20), // Mengatur gaya teks Arab dzikir.
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Text(dzikir.latin ?? '',
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontSize: 14)), // Menampilkan transliterasi Latin dari dzikir.
        SizedBox(
          height: 20,
        ),
        Text(dzikir.translation ?? '',
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontSize:
                    14)), // Menampilkan terjemahan dzikir dalam bahasa Indonesia.
      ],
    ),
  );
}
