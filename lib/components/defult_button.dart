import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mining_sett/components/pop_up_defult_mobile.dart';

class Defultbutton extends StatelessWidget {
  const Defultbutton({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  get kPrimaryColor => null;

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Container(
      width: 350, height: 80,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.amber.shade300,
            Colors.amber,
          ],
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade700,
              spreadRadius: 2,
              blurRadius: 9,
              offset: Offset(-2, 3) // changes position of shadow
              ),
        ],
      ),
      // ignore: deprecated_member_use
      child: FlatButton(
        splashColor: Colors.green.shade100,
        textColor: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // Replace with a Row for horizontal icon + text
          children: <Widget>[
            Text(title,
                style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 20))),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        onPressed: () {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => PopUpDefultMobile(),
          );
        },
      ),
    );
  }
}
