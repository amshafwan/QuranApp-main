import 'package:alqurann/model/adzan_model.dart';
import 'package:alqurann/viewmodel/adzanviewmodel.dart';
import 'package:flutter/material.dart';

class TabAdzan extends StatefulWidget {
  @override
  _TabAdzanState createState() => _TabAdzanState();
}

class _TabAdzanState extends State<TabAdzan> {
  @override
  Widget build(BuildContext context) {
    final AdzanViewModel _viewModel = AdzanViewModel(dateTime: DateTime.now(), name: ''); // You should initialize dateTime properly or adjust the constructor.

    return Scaffold(
      appBar: AppBar(
        title: Text('Jadwal Adzan'),
      ),
      body: FutureBuilder<List<JadwalAdzan>>(
        future: _viewModel.getListAdzan(), // Assuming this method returns a list of JadwalAdzan objects
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error loading data"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No data available"));
          } else {
            JadwalAdzan jadwalAdzan = snapshot.data!.first; // Assuming you want to display the first entry

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