import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefultbuttonBuy extends StatelessWidget {
  const DefultbuttonBuy({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);
  final String title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
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
                style:
                    GoogleFonts.quicksand(textStyle: TextStyle(fontSize: 17))),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        onPressed: press,
      ),
    );
  }
}
