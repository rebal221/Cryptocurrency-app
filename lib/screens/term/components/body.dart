import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mining_sett/AppResponsive.dart';
import 'package:mining_sett/components/defult_buy_button.dart';
import 'package:mining_sett/components/primary_user_menu.dart';
import 'package:mining_sett/constants.dart';
import 'package:mining_sett/localization/language/languages.dart';
import 'package:mining_sett/screens/home/home_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:mining_sett/screens/home/components/footer_scetion_Mobile.dart';
import 'package:mining_sett/screens/home/components/footer_scetion_web.dart';
import 'package:flutter/services.dart' show rootBundle;

class Body extends StatefulWidget {
  const Body({
    Key? key,
    required this.screenwidth,
    required this.screenheight,
  }) : super(key: key);

  final double screenwidth;
  final double screenheight;

  @override
  State<Body> createState() => _BodyState();
}

// String dataFromFile = "";

class _BodyState extends State<Body> {
  late Future _future;

  Future<String> loadString() async =>
      await rootBundle.loadString('assets/terms.txt');
  @override
  void initState() {
    _future = loadString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // readText();
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 30),
          Text(Languages.of(context)!.titleterm,
              style: GoogleFonts.lato(fontSize: 40)),
          SizedBox(height: 30),
          Container(
            width: widget.screenwidth < 900
                ? widget.screenwidth
                : widget.screenwidth - 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: hoverColor,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade700,
                    spreadRadius: 2,
                    blurRadius: 9,
                    offset: const Offset(-2, 3) // changes position of shadow
                    ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
              child: Column(
                children: [
                  FutureBuilder(
                      future: _future,
                      builder: (context, snapshot) => SelectableText(
                          snapshot.hasData
                              ? '${snapshot.data}'
                              : ' Reading...')),
                  SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width < 900
                        ? MediaQuery.of(context).size.width / 3
                        : MediaQuery.of(context).size.width / 5,
                    child: DefultbuttonBuy(
                        title: "Go Home",
                        press: () {
                          Navigator.pushNamed(context, HomeScreen.routeName);
                        }),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
          widget.screenwidth < 900 ? FooterScetionMobile() : FooterScetionWeb()
        ],
      ),
    );
  }
}
