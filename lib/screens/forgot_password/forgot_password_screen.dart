import 'package:flutter/material.dart';
import 'package:mining_sett/components/home_app_bar.dart';
import 'package:mining_sett/components/side_bar.dart';
import 'package:mining_sett/screens/forgot_password/components/body.dart';

class ForgotPassword extends StatelessWidget {
  static String routeName = "/recovery";

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
