import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserMenuItemsWeb extends StatelessWidget {
  const UserMenuItemsWeb({
    Key? key,
    required this.text,
    required this.icon,
    required this.press,
  }) : super(key: key);
  final String text;
  final String icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: press,
        child: Container(
          height: 50,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 15),
              new Container(
                width: 30,
                height: 30,
                child: Image.asset(
                  icon,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                text,
                style: GoogleFonts.lato(
                    textStyle: TextStyle(fontSize: 20, color: Colors.black)),
              ),
              SizedBox(width: 40),
              Container(
                width: 5,
                height: 50,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
