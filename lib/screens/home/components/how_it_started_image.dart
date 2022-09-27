import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HowItStartedImage extends StatelessWidget {
  const HowItStartedImage({
    Key? key,
    required this.image,
    required this.tilte,
    required this.titledec,
  }) : super(key: key);
  final String image;
  final String tilte;
  final String titledec;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.width / 7,
          width: MediaQuery.of(context).size.width / 7,
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.fill,
            ),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade700,
                  spreadRadius: 2,
                  blurRadius: 9,
                  offset: Offset(-2, 3) // changes position of shadow
                  ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          tilte,
          style: GoogleFonts.quicksand(
              textStyle: TextStyle(
                  fontSize: 23,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
        ),
        Text(
          titledec,
          style: GoogleFonts.quicksand(
              textStyle: TextStyle(fontSize: 15, color: Colors.black)),
        ),
      ],
    );
  }
}
