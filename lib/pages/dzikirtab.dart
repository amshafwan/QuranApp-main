import 'package:alqurann/model/dzikir_mewing.dart';
import 'package:alqurann/model/dzikir_model.dart';
import 'package:alqurann/pages/tabs/detaildzikir.dart';
import 'package:alqurann/theme.dart';
import 'package:alqurann/viewmodel/mewing_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class tabDzikir extends StatelessWidget {
  const tabDzikir({super.key});

  @override
  Widget build(BuildContext context) {
    final MewingViewModel _viewModel =
        MewingViewModel(); // Inisialisasi ViewModel untuk mengambil data Dzikir Mewing.
    return Scaffold(
      body: FutureBuilder(
        // Menggunakan FutureBuilder untuk membangun UI berdasarkan status future.
        future: _viewModel
            .getListMewing(), // Memanggil fungsi untuk mendapatkan daftar Dzikir Mewing dari ViewModel.
        builder: (context, snapshot) {
          // Membangun UI berdasarkan snapshot dari future.
          if (!snapshot.hasData) {
            // Jika data belum tersedia (snapshot tidak memiliki data).
            return Center(
              child: Text(
                  "No Data"), // Tampilkan pesan "No Data" jika tidak ada data.
            );
          } else {
            // Jika data tersedia.
            return ListView.separated(
                // Membuat daftar item Dzikir dengan pemisah di antara item.
                itemBuilder: (context, index) => _itemList(
                    // Membuat setiap item dalam daftar.
                    context: context,
                    mewing: snapshot.data!
                        .elementAt(index)), // Mengirimkan data Dzikir ke item.
                separatorBuilder: (context, index) => Divider(
                      // Menambahkan garis pemisah antara item.
                      color: Colors.grey.withOpacity(1),
                    ),
                itemCount: snapshot
                    .data!.length); // Menentukan jumlah item dalam daftar.
          }
        },
      ),
    );
  }
}



Widget _itemList(
        {required BuildContext context,
        required DzikirMewing
            mewing}) => // Membuat widget item untuk ditampilkan dalam daftar.
    InkWell(
      // InkWell digunakan untuk memberikan efek saat item ditekan.
      onTap: () {
        // Ketika item ditekan.
        Navigator.pushNamed(context,
            detaildzikir.routeName, // Navigasi ke halaman detail Dzikir.
            arguments:
                mewing.id.toString()); // Mengirimkan ID Dzikir sebagai argumen.
      },
      child: Container(
        // Membuat container untuk membungkus konten item.
        padding: EdgeInsets.all(15), // Menambahkan padding di sekitar konten.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment
              .start, // Mengatur konten agar berbaris di sebelah kiri.
          children: [
            Text(
              mewing.title.toString(), // Menampilkan judul Dzikir.
              style: GoogleFonts.poppins(
                  // Menggunakan font Poppins dengan gaya bold.
                  fontWeight: FontWeight.bold,
                  color: primary),
            ),
          ],
        ),
      ),
    );
