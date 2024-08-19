// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:alqurann/homescreen.dart';
// import 'package:alqurann/theme.dart';

// class spalshScreen extends StatelessWidget {
//   static String routeName = 'splash_screen';

//   const spalshScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     dynamic value;
//     if (value == null) {
//       value = "guest";
//     } else {
//       value = value;
//     }
//     return Scaffold(
//       backgroundColor: background,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 24),
//         child: Center(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 "Quran App",
//                 style: GoogleFonts.poppins(
//                     fontSize: 28, color: primary, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(
//                 height: 16,
//               ),
//               Text("Learn Quran And \nRecite once everyday",
//                   textAlign: TextAlign.center,
//                   style: GoogleFonts.poppins(
//                     fontSize: 18,
//                     color: secondary,
//                   )),
//               const SizedBox(
//                 height: 18,
//               ),
//               Stack(
//                 clipBehavior: Clip.none,
//                 children: [
//                   Container(
//                     height: 450,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       color: primary,
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     child: SvgPicture.asset("assets/svg/splash.svg"),
//                   ),
//                   Positioned(
//                     bottom: -20,
//                     right: 0,
//                     left: 0,
//                     child: Center(
//                       child: InkWell(
//                         borderRadius: BorderRadius.circular(25),
//                         onTap: () {
//                           Navigator.pushNamed(context, homeScreen.routeName);
//                         },
//                         child: Container(
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 48, vertical: 12),
//                             decoration: BoxDecoration(
//                               color: orange,
//                               borderRadius: BorderRadius.circular(25),
//                             ),
//                             child: Column(
//                               children: [
//                                 TextField(
//                                   onChanged: (text) {
//                                     value = text;
//                                   },
//                                 ),
//                                 ElevatedButton(
//                                   onPressed: () {
//                                     Navigator.of(context).push(
//                                         MaterialPageRoute(
//                                             builder: (context) =>
//                                                 homeScreen(value: value)));
//                                   },
//                                   child: Text(
//                                     "Get Started",
//                                     style: GoogleFonts.poppins(
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.w600),
//                                   ),
//                                 )
//                               ],
//                             )),
//                       ),
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
