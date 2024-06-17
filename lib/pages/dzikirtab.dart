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
    final MewingViewModel _viewModel = MewingViewModel();
    return Scaffold(
      body: FutureBuilder(
        future: _viewModel.getListMewing(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Text("No Data"),
            );
          } else {
            return ListView.separated(
                itemBuilder: (context, index) => _itemList(
                    context: context, mewing: snapshot.data!.elementAt(index)),
                separatorBuilder: (context, index) => Divider(
                      color: Colors.grey.withOpacity(1),
                    ),
                itemCount: snapshot.data!.length);
          }
        },
      ),
    );
  }
}

Widget _itemList(
        {required BuildContext context, required DzikirMewing mewing}) =>
    InkWell(
      onTap: () {
        Navigator.pushNamed(context, detaildzikir.routeName,
            arguments: mewing.id.toString());
      },
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              mewing.title.toString(),
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, color: primary),
            ),
          ],
        ),
      ),
    );
