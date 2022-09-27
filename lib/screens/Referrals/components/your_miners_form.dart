import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mining_sett/constants.dart';

class YourMinersForm extends StatelessWidget {
  const YourMinersForm({
    Key? key,
    required this.screenwidth,
    required this.text,
  }) : super(key: key);

  final double screenwidth;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenwidth < 950 ? screenwidth / 2.6 : screenwidth / 6,
      // height: 130,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade500,
              spreadRadius: 2,
              blurRadius: 9,
              offset: Offset(-2, 3) // changes position of shadow
              ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(height: 10),
          Text(
            text,
            style: GoogleFonts.lato(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          horizontalLine(screenwidth / 6.5),
          SizedBox(height: 10),
          Container(
            height: 20,
            child: TextFormField(
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: '100000',
                  border: InputBorder.none,
                )),
          )
        ],
      ),
    );
  }
}
