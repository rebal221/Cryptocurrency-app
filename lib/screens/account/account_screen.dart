import 'package:flutter/material.dart';
import 'package:mining_sett/components/custom_mobile_appbar.dart';
import 'package:mining_sett/components/home_app_bar.dart';
import 'package:mining_sett/components/side_bar.dart';
import 'package:mining_sett/components/side_bar_user.dart';
import 'package:mining_sett/screens/account/components/body.dart';

class Account extends StatefulWidget {
  static String routeName = "/account";

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  get hoverColor => null;

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      endDrawer: const SideBarUser(),
      appBar: HomeAppBar(),
      backgroundColor: hoverColor,
      body: Body(screenwidth: screenwidth, screenheight: screenheight),
    );
  }
}
