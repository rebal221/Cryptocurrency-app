import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mining_sett/components/pop_up_defult_mobile.dart';

class Miner extends StatelessWidget {
  const Miner({
    Key? key,
    required this.textone,
    required this.texttow,
    required this.image,
  }) : super(key: key);
  final String textone;
  final String texttow;
  final String image;

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
        width: screenwidth < 850 ? screenwidth / 4 : 200,
        height: screenwidth < 850 ? screenwidth / 4 : 200,
        decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.width < 900
                  ? MediaQuery.of(context).size.width / 10
                  : MediaQuery.of(context).size.height / 8,
              width: MediaQuery.of(context).size.width < 900
                  ? MediaQuery.of(context).size.width / 10
                  : MediaQuery.of(context).size.width / 8,
              decoration: BoxDecoration(
                // color: Colors.red,
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Text(textone,
                style: GoogleFonts.quicksand(
                    textStyle: TextStyle(
                        fontSize:
                            MediaQuery.of(context).size.width < 950 ? 9 : 13))),
            SizedBox(height: 3),
            Text(texttow,
                style: GoogleFonts.quicksand(
                    textStyle: TextStyle(
                        fontSize:
                            MediaQuery.of(context).size.width < 950 ? 9 : 13)))
          ],
        ));
  }
}
