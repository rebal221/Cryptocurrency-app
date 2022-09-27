import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mining_sett/AppResponsive.dart';
import 'package:mining_sett/components/defult_button.dart';
import 'package:mining_sett/constants.dart';
import 'package:mining_sett/localization/language/languages.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;

    return Container(
        height: 650,
        width: MediaQuery.of(context).size.width,
        child: Stack(fit: StackFit.expand, children: [
          Image.asset(
            'assets/images/background2.png',
            fit: BoxFit.cover,
          ),
          HomeSectionTextmobile()
        ]));
  }
}

class HomeSectionTextweb extends StatelessWidget {
  const HomeSectionTextweb({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 500,
        width: 1000,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Languages.of(context)!.cloudMining,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber,
                  )),
                ),
                Text(
                  Languages.of(context)!.platForm,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
                ),
              ],
            ),
            SizedBox(height: 30),
            Text(
              Languages.of(context)!.homeSectiontext,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                  textStyle: TextStyle(
                fontSize: 20,
                color: Colors.white,
              )),
            ),
            SizedBox(height: 40),
            Defultbutton(title: Languages.of(context)!.calculateIncomeButton),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class HomeSectionTextmobile extends StatelessWidget {
  const HomeSectionTextmobile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Container(
          // height: 500,
          // width: 1000,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                Languages.of(context)!.cloudMining,
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber,
                )),
              ),
              Text(
                Languages.of(context)!.platForm,
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Text(
                  Languages.of(context)!.homeSectiontext,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.quicksand(
                      textStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  )),
                ),
              ),
              SizedBox(height: 40),
              Container(
                  width: MediaQuery.of(context).size.width - 100,
                  child: Defultbutton(
                      title: Languages.of(context)!.calculateIncomeButton)),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
