// import 'package:alqurann/model/doa_model.dart';
// import 'package:alqurann/pages/tabs/detaildzikir.dart';
// import 'package:alqurann/theme.dart';
// import 'package:alqurann/viewmodel/adzanviewmodel.dart';
// import 'package:alqurann/viewmodel/doaviewmodel.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';

// class tabAdzan extends StatelessWidget {
//   const tabAdzan({super.key});
//   @override
//   Widget build(BuildContext context) {
//     final AdzanViewModel _viewModel = AdzanViewModel();
//     return Scaffold(
//       body: FutureBuilder(
//         future: _viewModel.getListAdzan(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return Center(child: Text("no data"));
//           } else {
//             return ListView.separated(
//                 itemBuilder: (context, index) => _ListDoa(
//                     context: context, doa: snapshot.data!.elementAt(index)),
//                 separatorBuilder: (context, index) => Divider(
//                       color: Colors.grey.withOpacity(1),
//                       height: 1,
//                     ),
//                 itemCount: snapshot.data!.length);
//           }
//         },
//       ),
//     );
//   }
// }

// Widget _ListDoa({required BuildContext context, required doa doa}) {
//   return Container(
//     padding: EdgeInsets.all(15),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           doa.title.toString().toUpperCase(),
//           style:
//               GoogleFonts.poppins(fontWeight: FontWeight.bold, color: primary),
//         ),
//         SizedBox(
//           height: 50,
//         ),
//         Row(
//           children: [
//             SizedBox(
//               height: 50,
//               width: 10,
//             ),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Text(
//                     doa.arabic.toString(),
//                     textAlign: TextAlign.end,
//                     style: GoogleFonts.amiriQuran(
//                         fontWeight: FontWeight.w600,
//                         color: Colors.black,
//                         fontSize: 20),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         SizedBox(
//           height: 20,
//         ),
//         Text(doa.latin.toString(),
//             style: GoogleFonts.poppins(
//                 fontWeight: FontWeight.w400,
//                 color: Colors.black,
//                 fontSize: 14)),
//         SizedBox(
//           height: 20,
//         ),
//         Text(doa.translation.toString(),
//             style: GoogleFonts.poppins(
//                 fontWeight: FontWeight.w400,
//                 color: Colors.black,
//                 fontSize: 14)),
//       ],
//     ),
//   );
// }
