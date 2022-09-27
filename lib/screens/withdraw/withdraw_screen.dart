import 'package:flutter/material.dart';
import 'package:mining_sett/components/custom_mobile_appbar.dart';
import 'package:mining_sett/components/home_app_bar.dart';
import 'package:mining_sett/components/side_bar.dart';
import 'package:mining_sett/components/side_bar_user.dart';
import 'package:mining_sett/screens/withdraw/components/body.dart';

class Withdraw extends StatefulWidget {
  static String routeName = "/withdraw";

  @override
  _WithdrawState createState() => _WithdrawState();
}

class _WithdrawState extends State<Withdraw> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      endDrawer: const SideBarUser(),
      appBar: HomeAppBar(),
      body: Body(screenwidth: screenwidth, screenheight: screenheight),
    );
  }
}
