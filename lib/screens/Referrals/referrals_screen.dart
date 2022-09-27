import 'package:flutter/material.dart';
import 'package:mining_sett/components/custom_mobile_appbar.dart';
import 'package:mining_sett/components/home_app_bar.dart';
import 'package:mining_sett/components/side_bar_user.dart';
import 'package:mining_sett/screens/Referrals/components/body.dart';

class Referrals extends StatefulWidget {
  static String routeName = "/referrals";

  @override
  _ReferralsState createState() => _ReferralsState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

class _ReferralsState extends State<Referrals> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: SideBarUser(),
      appBar: HomeAppBar(),
      body: Body(screenwidth: screenwidth, screenheight: screenheight),
    );
  }
}
