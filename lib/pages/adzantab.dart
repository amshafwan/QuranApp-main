import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:alqurann/viewmodel/adzanviewmodel.dart';
import 'package:alqurann/model/adzan_model.dart';

class TabAdzan extends StatefulWidget {
  @override
  _TabAdzanState createState() => _TabAdzanState();
}

class _TabAdzanState extends State<TabAdzan> {
  @override
  void initState() {
    super.initState();
    // Memanggil fetchAdzanData untuk mengambil data adzan saat widget diinisialisasi
    Future.microtask(() {
      Provider.of<AdzanViewModel>(context, listen: false).fetchAdzanData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jadwal Adzan'),
      ),
      body: Consumer<AdzanViewModel>(
        builder: (context, viewModel, child) {
          return FutureBuilder<List<JadwalAdzan>>(
            future:
                Future.value(viewModel.adzanList), // Menggunakan Future.value
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text("Error loading data"));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text("No data available"));
              } else {
                JadwalAdzan jadwalAdzan = snapshot.data!.first;

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
          );
        },
      ),
    );
  }
}
