import 'package:alqurann/model/doa_model.dart'; // Mengimpor model data doa.
import 'package:alqurann/pages/tabs/detaildzikir.dart'; // Mengimpor halaman detail dzikir.
import 'package:alqurann/theme.dart'; // Mengimpor tema aplikasi.
import 'package:alqurann/viewmodel/doaviewmodel.dart'; // Mengimpor ViewModel untuk doa.
import 'package:flutter/material.dart'; // Mengimpor widget dasar Flutter.
import 'package:flutter_svg/flutter_svg.dart'; // Mengimpor untuk mendukung gambar SVG.
import 'package:google_fonts/google_fonts.dart'; // Mengimpor Google Fonts untuk font khusus.

class tabDoa extends StatelessWidget {
  // Membuat widget Stateless untuk tab doa.
  const tabDoa({super.key}); // Konstruktor dengan key opsional.

  @override
  Widget build(BuildContext context) {
    final DoaViewModel _viewModel =
        DoaViewModel(); // Menginisialisasi ViewModel untuk doa.

    return Scaffold( 
      body: FutureBuilder(
        future:
            _viewModel.getListDoa(), // Mendapatkan daftar doa dari ViewModel.
        builder: (context, snapshot) {
          // Membangun UI berdasarkan status snapshot.
          if (!snapshot.hasData) { // Jika data belum tersedia.
            return Center(child: Text("no data")); // Tampilkan teks "no data".
          } else {
            // Jika data tersedia.
            return ListView.separated(
                // Tampilkan data dalam ListView dengan pemisah.
                itemBuilder: (context, index) => _ListDoa(
                    // Membuat widget doa untuk setiap item.
                    context: context,
                    doa: snapshot.data!
                        .elementAt(index)), // Ambil item doa berdasarkan index.
                separatorBuilder: (context, index) => Divider(
                      // Garis pemisah antara item.
                      color: Colors.grey.withOpacity(1), // Warna garis pemisah.
                      height: 1, // Tinggi garis pemisah.
                    ),
                itemCount:
                    snapshot.data!.length); // Jumlah item dalam ListView.
          }
        },
      ),
    );
  }
}

Widget _ListDoa({required BuildContext context, required doa doa}) {
  // Fungsi untuk membangun widget item doa.
  return Container(
    // Menggunakan container untuk mengatur layout.
    padding: EdgeInsets.all(15), // Padding di dalam container.
    child: Column(
      // Mengatur widget dalam kolom vertikal.
      crossAxisAlignment: CrossAxisAlignment.start, // Posisi di sisi kiri.
      children: [
        Text(
          // Menampilkan judul doa.
          doa.title.toString().toUpperCase(), // Judul doa dalam huruf besar.
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              color: primary), // Menggunakan font Poppins dan warna utama.
        ),
        SizedBox(
          // Jarak vertikal.
          height: 50,
        ),
        Row(
          // Baris horizontal untuk teks Arab.
          children: [
            SizedBox(
              // Spasi di sebelah kiri.
              height: 50,
              width: 10,
            ),
            Expanded(
              // Kolom untuk teks Arab dengan lebar penuh.
              child: Column(
                // Kolom untuk mengatur teks Arab di akhir baris.
                crossAxisAlignment: CrossAxisAlignment.end, // Teks rata kanan.
                children: [
                  Text(
                    // Menampilkan teks Arab.
                    doa.arabic.toString(), // Teks doa dalam bahasa Arab.
                    textAlign: TextAlign.end, // Penjajaran teks di akhir.
                    style: GoogleFonts.amiriQuran(
                        // Menggunakan font Amiri Quran untuk teks Arab.
                        fontWeight: FontWeight.w600, // Tebal sedang.
                        color: Colors.black, // Warna hitam.
                        fontSize: 20), // Ukuran font 20.
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          // Jarak vertikal.
          height: 20,
        ),
        Text(doa.latin.toString(), // Menampilkan teks Latin (transliterasi).
            style: GoogleFonts.poppins(
                // Menggunakan font Poppins.
                fontWeight: FontWeight.w400, // Tebal normal.
                color: Colors.black, // Warna hitam.
                fontSize: 14)), // Ukuran font 14.
        SizedBox(
          // Jarak vertikal.
          height: 20,
        ),
        Text(doa.translation.toString(), // Menampilkan terjemahan doa.
            style: GoogleFonts.poppins(
                // Menggunakan font Poppins.
                fontWeight: FontWeight.w400, // Tebal normal.
                color: Colors.black, // Warna hitam.
                fontSize: 14)), // Ukuran font 14.
      ],
    ),
  );
}
