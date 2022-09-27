import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kPrimaryColor = Color.fromRGBO(15, 148, 97, 1);
const kScoundrColor = Colors.amber;
const hoverColor = Color.fromRGBO(249, 253, 249, 1);
const fontprimaryColor = Colors.white;
const kPrimaryLightColor = Color(0xFFF1E6FF);

Padding varticalLine(double height) {
  return Padding(
    padding: EdgeInsets.all(0),
    child: Container(
      height: height,
      width: 1.0,
      color: Colors.grey,
    ),
  );
}

Padding horizontalLine(double width) {
  return Padding(
    padding: EdgeInsets.all(4),
    child: Container(
      height: 1.0,
      width: width,
      color: Colors.grey.shade400,
    ),
  );
}

final headingStyle = GoogleFonts.quicksand(
    textStyle: TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
));

final defultStyle = GoogleFonts.lato(
  textStyle: TextStyle(color: Colors.white),
);

final otpInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 15),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: kPrimaryColor),
  );
}

const copyRightsText = Text(
  '2021 © MINING SET, All Rights Reserved',
  style: TextStyle(fontSize: 14, color: Colors.black),
);

final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

class TitleHover extends StatelessWidget {
  final String title, icon;
  final VoidCallback press;

  const TitleHover(
      {Key? key, required this.title, required this.icon, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      hoverColor: kPrimaryColor,
      leading: Image.asset(
        icon,
        color: Colors.white,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
