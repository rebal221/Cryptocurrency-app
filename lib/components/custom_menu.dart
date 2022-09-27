import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mining_sett/localization/language/language_data.dart';
import 'package:mining_sett/localization/language/languages.dart';
import 'package:mining_sett/localization/locale_constant.dart';
import 'package:mining_sett/screens/FQS/faq_screen.dart';
import 'package:mining_sett/screens/blog/blog_screen.dart';
import 'package:mining_sett/screens/contact_us/contact_us_sceen.dart';
import 'package:mining_sett/screens/home/home_screen.dart';
import 'package:mining_sett/screens/prices/prices_screen.dart';

import '../constants.dart';

class CustomMenu extends StatefulWidget {
  @override
  _CustomMenuState createState() => _CustomMenuState();
}

class _CustomMenuState extends State<CustomMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          pageTitleWeb(
            title: Languages.of(context)!.titleHome,
            press: () {
              Navigator.pushNamed(context, HomeScreen.routeName);
            },
          ),
          SizedBox(width: 30),
          pageTitleWeb(
            title: Languages.of(context)!.titlePrices,
            press: () {
              Navigator.pushNamed(context, PricesScreen.routeName);
            },
          ),
          SizedBox(width: 30),
          pageTitleWeb(
            title: Languages.of(context)!.titleContactUs,
            press: () {
              Navigator.pushNamed(context, ContactUsScreen.routeName);
            },
          ),
          SizedBox(width: 30),
          pageTitleWeb(
            title: Languages.of(context)!.titleHowITWork,
            press: () {
              Navigator.pushNamed(context, FAQ.routeName);
            },
          ),
          SizedBox(width: 30),
          pageTitleWeb(
            title: Languages.of(context)!.titleBlog,
            press: () {
              Navigator.pushNamed(context, BlogScreen.routeName);
            },
          ),
          SizedBox(width: 30),
          buttonlangauage(),
        ],
      ),
    );
  }

  Padding buttonlangauage() {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: Container(
        height: 29,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 1, //                   <--- border width here
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<LanguageData>(
              iconSize: 40,
              style: TextStyle(fontSize: 16, color: kPrimaryColor),
              icon: Icon(Icons.arrow_drop_down, size: 25, color: Colors.white),
              iconEnabledColor: kPrimaryColor,
              onChanged: (language) {
                changeLanguage(context, language!.languageCode);
                setState(() {});
              },
              items: LanguageData.languageList()
                  .map<DropdownMenuItem<LanguageData>>(
                    (e) => DropdownMenuItem<LanguageData>(
                      value: e,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: 30,
                            height: 30,
                            child: SvgPicture.asset(
                              e.flag,
                              height: 30.0,
                              width: 30.0,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                          // Text(
                          //   e.flag,
                          //   style: TextStyle(fontSize: 20),
                          // ),
                          Text(e.name)
                        ],
                      ),
                    ),
                  )
                  .toList(),
              hint: Text(
                Languages.of(context)!.titleLan,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class pageTitleWeb extends StatelessWidget {
  const pageTitleWeb({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);
  final String title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: press,
        child: Text(
          title,
          style: GoogleFonts.lato(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}

class pageTitleMobile extends StatelessWidget {
  const pageTitleMobile({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);
  final String title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Text(
        title,
        style: GoogleFonts.lato(
          textStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
