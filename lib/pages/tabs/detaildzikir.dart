
import 'package:alqurann/model/doa_model.dart';
import 'package:alqurann/model/dzikir_model.dart';
import 'package:alqurann/theme.dart';
import 'package:alqurann/viewmodel/detaildoaviewmodel.dart';
import 'package:alqurann/viewmodel/doaviewmodel.dart';
import 'package:alqurann/viewmodel/dzikirviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class detaildzikir extends StatelessWidget {
  static const routeName = 'detail_dzikir';
  final String id_dzikir;
  const detaildzikir({super.key, required this.id_dzikir});

  @override
  Widget build(BuildContext context) {
    final dzikirViewModel _viewModel = dzikirViewModel();

    return Scaffold(
      body: FutureBuilder(
        future: _viewModel.getListDzikir(id_dzikir),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: Text("no data"));
          } else {
            return ListView.separated(
                itemBuilder: (context, index) => _ListDoa(
                    context: context,
                    dzikir: snapshot.data!.dzikir!.elementAt(index)),
                separatorBuilder: (context, index) => Divider(
                      color: Colors.grey.withOpacity(0.1),
                      height: 1,
                    ),
                itemCount: snapshot.data!.dzikir!.length);
          }
        },
      ),
    );
  }
}

Widget _ListDoa({required BuildContext context, required Dzikir dzikir}) {
  return Container(
    padding: EdgeInsets.all(15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          dzikir.title.toString().toUpperCase(),
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500, fontSize: 18, color: primary),
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
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    dzikir.arabic.toString(),
                    textAlign: TextAlign.end,
                    style: GoogleFonts.amiriQuran(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 20),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Text(dzikir.latin.toString(),
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontSize: 14)),
        SizedBox(
          height: 20,
        ),
        Text(dzikir.translation.toString(),
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontSize: 14)),
      ],
    ),
  );
}
