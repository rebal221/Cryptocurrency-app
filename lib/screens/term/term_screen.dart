import 'package:flutter/material.dart';
import 'package:mining_sett/components/home_app_bar.dart';
import 'package:mining_sett/components/side_bar.dart';
import 'package:mining_sett/components/side_bar_user.dart';
import 'package:mining_sett/screens/term/components/body.dart';

class Term extends StatefulWidget {
  static String routeName = "/terms";
  const Term({Key? key}) : super(key: key);

  @override
  _TermState createState() => _TermState();
}

class _TermState extends State<Term> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      endDrawer: const SideBar(),
      appBar: const HomeAppBar(),
      body: Body(screenwidth: screenwidth, screenheight: screenheight),
    );
  }
}
