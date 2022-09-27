import 'package:flutter/material.dart';
import 'package:mining_sett/AppResponsive.dart';
import 'package:mining_sett/screens/home/components/activte_plan_section.dart';
import 'package:mining_sett/screens/home/components/faq_section.dart';
import 'package:mining_sett/screens/home/components/footer_scetion_Mobile.dart';
import 'package:mining_sett/screens/home/components/footer_scetion_web.dart';
import 'package:mining_sett/screens/home/components/how_it_stareted_with_out.dart';
import 'package:mining_sett/screens/home/components/what_is_coin_section.dart';

import 'home_section.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
        child: Column(
      children: [
        Stack(
          children: <Widget>[
            HomeSection(),
          ],
        ),
        HowItStartedSectionWithOutPointer(),
        if (AppResponsive.isWeb(context)) ...{
          WhatIscoinSection(),
        },
        FAQSection(),
        size > 900 ? FooterScetionWeb() : FooterScetionMobile()
      ],
    ));
  }
}
