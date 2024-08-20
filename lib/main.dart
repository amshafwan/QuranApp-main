import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:alqurann/viewmodel/adzanviewmodel.dart'; // Import ViewModel
import 'package:alqurann/repository/quran_repository.dart'; // Import Repository
import 'package:alqurann/pages/tabs/detaildzikir.dart';
import 'package:alqurann/homescreen.dart';
import 'package:alqurann/pages/tabs/detailscreen.dart';
import 'package:alqurann/splashscreen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AdzanViewModel(repository: QuranRepository()),
        ),
        // Tambahkan provider lain jika diperlukan
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: homeScreen.routeName,
      routes: {
        // spalshScreen.routeName: (context) => const spalshScreen(),
        homeScreen.routeName: (context) => homeScreen(), // Hapus `const`
        DetailScreen.routeName: (context) => DetailScreen(
            id_surah: ModalRoute.of(context)?.settings.arguments as String),
        detaildzikir.routeName: (context) => detaildzikir(
            id_dzikir: ModalRoute.of(context)?.settings.arguments as String)
      },
    );
  }
}

