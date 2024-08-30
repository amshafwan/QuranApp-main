import 'package:alqurann/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:alqurann/viewmodel/adzanviewmodel.dart';
import 'package:alqurann/model/adzan_model.dart';
import 'package:google_fonts/google_fonts.dart';

class TabAdzan extends StatefulWidget {
  @override
  _TabAdzanState createState() =>
      _TabAdzanState(); // Membuat state untuk `TabAdzan`.
}

class _TabAdzanState extends State<TabAdzan> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<AdzanViewModel>(context, listen: false).fetchAdzanData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jadwal Adzan'),
        titleTextStyle:
            GoogleFonts.poppins(fontWeight: FontWeight.bold, color: primary),
        // Menentukan teks untuk AppBar dengan gaya teks khusus menggunakan GoogleFonts.
      ),
      body: Consumer<AdzanViewModel>(
        builder: (context, viewModel, child) {
          // Tidak perlu menggunakan FutureBuilder jika data sudah diambil di initState
          if (viewModel.adzanList.isEmpty) {
            return Center(
              child: CircularProgressIndicator(),
            ); // Menampilkan loading spinner jika data belum ada.
          } else {
            int today = int.parse(DateFormat('d')
                .format(DateTime.now())); // Mendapatkan tanggal hari ini.
            JadwalAdzan jadwalAdzan = viewModel.adzanList[today -
                1]; // Mengambil jadwal adzan berdasarkan tanggal hari ini.

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Subuh'),
                          Text(jadwalAdzan.shubuh ?? 'N/A'),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Dzuhur'),
                          Text(jadwalAdzan.dzuhur ?? 'N/A'),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Ashar'),
                          Text(jadwalAdzan.ashr ?? 'N/A'),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Maghrib'),
                          Text(jadwalAdzan.magrib ?? 'N/A'),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Isya'),
                          Text(jadwalAdzan.isya ?? 'N/A'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
