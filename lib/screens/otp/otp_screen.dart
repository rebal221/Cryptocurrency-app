import 'package:flutter/material.dart';
import 'package:mining_sett/components/home_app_bar.dart';
import 'package:mining_sett/components/side_bar.dart';
import 'package:mining_sett/screens/otp/components/body.dart';

class OtpScreen extends StatelessWidget {
  static String routeName = "/verification";
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      endDrawer: const SideBar(),
      appBar: HomeAppBar(),
      backgroundColor: Colors.white,
      body: Center(
          child: Body(
        context: context,
        screenheight: screenheight,
        screenwidth: screenwidth,
      )),
    );
  }
}
