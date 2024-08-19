import 'package:alqurann/pages/adzantab.dart';
import 'package:alqurann/viewmodel/ayahviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:alqurann/component/tabitem.dart';
import 'package:alqurann/pages/doatab.dart';
import 'package:alqurann/pages/dzikirtab.dart';
import 'package:alqurann/pages/surahtab.dart';
import 'package:alqurann/theme.dart';
import 'package:intl/intl.dart';


//halaman utama app.
class homeScreen extends StatelessWidget {
  static String routeName = 'home_screen';
  dynamic value;
  homeScreen({super.key, this.value});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(value),
    );
  }
}

AppBar _appBar() => AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      // leading: IconButton(
      //     onPressed: () {}, icon: SvgPicture.asset('assets/svg/menu_icon.svg')),
      title: Text(
        "Al Muttaqin App",
        style: GoogleFonts.poppins(
            fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
      ),
      // actions: [
      //   IconButton(
      //       onPressed: () {},
      //       icon: SvgPicture.asset('assets/svg/search_icon.svg')),
      // ],
    );


    // Belum sempet

// BottomNavigationBar _bottomNavigationBar() => BottomNavigationBar(
//       type: BottomNavigationBarType.fixed,
//       backgroundColor: Colors.white,
//       items: [
//         _bottomNavigationBarItem(
//             icon: 'assets/svg/quran_icon.svg', label: 'Quran'),
//         _bottomNavigationBarItem(
//             icon: 'assets/svg/doa_icon.svg', label: 'News'),
//         _bottomNavigationBarItem(
//             icon: 'assets/svg/bookmark_icon.svg', label: 'Bookmark')
//       ],
//     );


// BottomNavigationBarItem _bottomNavigationBarItem(
//         {required String icon, required String label}) =>
//     BottomNavigationBarItem(
//         icon: SvgPicture.asset(icon, color: secondary),
//         activeIcon: SvgPicture.asset(
//           icon,
//           color: primary,
//         ),
//         label: label);

DefaultTabController _body(value) => DefaultTabController(
      length: 4, 
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: NestedScrollView(
          headerSliverBuilder:
              (BuildContext context, bool innerBoxIsScrolled) => [
            SliverToBoxAdapter(
              child: _salam(value), // Menampilkan salam di bagian atas halaman.
            ),
            SliverAppBar(
              pinned: true,
              elevation: 0,
              automaticallyImplyLeading: false,
              shape: Border(
                bottom: BorderSide(color: Colors.grey.withOpacity(0.1)),
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(0),
                child: TabBar(
                  labelColor: Colors.black,
                  indicatorColor: Colors.black,
                  indicatorWeight: 3,
                  tabs: [
                    itemTab(label: 'Surah'), // Tab untuk Surah
                    itemTab(label: 'Dzikir'), // Tab untuk Dzikir
                    itemTab(label: 'Doa'), // Tab untuk Doa
                    itemTab(label: 'Adzan') // Tab untuk Jadwal Adzan
                  ],
                ),
              ),
            ),
          ],
          body: TabBarView(
            children: [
              tabSurah(), // Konten untuk tab Surah
              tabDzikir(), // Konten untuk tab Dzikir
              tabDoa(),
              TabAdzan()// Konten untuk tab Doa
              // tabAdzan(), // Konten untuk tab Jadwal Adzan (widget baru)
            ],
          ),
        ),
      ),
    );
    
    


Column _salam(value) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Assalamualaikum",
          style: GoogleFonts.poppins(
              fontSize: 12, fontWeight: FontWeight.w600, color: secondary),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          "Welcome",
          style: GoogleFonts.poppins(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20,
        ),
        Stack(
          children: [
            Container(
              height: 131,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xffaad9bb), Color(0xff80bcbd)])),
            ),
            Positioned(
                bottom: 0,
                right: 0,
                child: SvgPicture.asset('assets/svg/quran_banner.svg')),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Row(
                  //   children: [
                  //     SvgPicture.asset('assets/svg/book.svg'),
                  //     SizedBox(
                  //       width: 8,
                  //     ),
                  //     Text(
                  //       "Last Read",
                  //       style: GoogleFonts.poppins(
                  //           fontSize: 14,
                  //           fontWeight: FontWeight.w500,
                  //           color: Colors.white),
                  //     ),
                  //   ],
                  // ),
                  
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Al Muttaqin",
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "selamat beribadah",
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                  Column(
                    children: [
                      StreamBuilder(
                          stream: Stream.periodic(Duration(seconds: 1)), // Membuat stream yang diperbarui setiap detik.
                          builder: (context, snapshot) {
                  return Text(
                    DateFormat('HH:mm:ss').format(DateTime.now()), // Menampilkan waktu saat ini dalam format HH:mm:ss.
                      style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.white),
                    );
                  }),
                ],
              ),
            ],
          ),
        )
      ],
    )
  ],
);