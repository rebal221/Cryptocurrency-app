import 'package:flutter/material.dart';
import 'package:mining_sett/components/home_app_bar.dart';
import 'package:mining_sett/components/side_bar_user.dart';
import 'package:mining_sett/screens/user_dashbord/components/body.dart';

class UserDashbord extends StatefulWidget {
  static String routeName = "/dashbord";

  const UserDashbord({Key? key}) : super(key: key);

  @override
  _UserDashbordState createState() => _UserDashbordState();
}

class _UserDashbordState extends State<UserDashbord> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      endDrawer: const SideBarUser(),
      appBar: const HomeAppBar(),
      body: Body(screenwidth: screenwidth, screenheight: screenheight),
    );
  }
}
