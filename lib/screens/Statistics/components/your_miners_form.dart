import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mining_sett/constants.dart';

class YourMinersForm extends StatelessWidget {
  const YourMinersForm({
    Key? key,
    required this.screenwidth,
    required this.text,
    required this.hint,
  }) : super(key: key);

  final double screenwidth;
  final String text;
  final String hint;

  @override
  Widget build(BuildContext context) {
    TextEditingController hinttext = TextEditingController();
    hinttext.text = hint;
    return Container(
      width: screenwidth < 950 ? screenwidth / 2.4 : screenwidth / 6,
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
          ),
          SizedBox(height: 10),
          horizontalLine(screenwidth / 6.5),
          SizedBox(height: 10),
          TextFormField(
            textAlign: TextAlign.center,
            controller: hinttext,
            readOnly: true,
          )
        ],
      ),
    );
  }
}
