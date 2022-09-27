import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mining_sett/constants.dart';

class UserMenuItemsUser extends StatelessWidget {
  const UserMenuItemsUser({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);
  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Text(
        text,
        style: GoogleFonts.lato(
            textStyle: TextStyle(fontSize: 20, color: Colors.white)),
      ),
    );
  }
}
