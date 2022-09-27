import 'package:flutter/material.dart';
import 'package:mining_sett/components/home_app_bar.dart';
import 'package:mining_sett/components/side_bar_user.dart';
import 'package:mining_sett/screens/Statistics/components/body.dart';

class Statistics extends StatefulWidget {
  static String routeName = "/statistics";

  const Statistics({Key? key}) : super(key: key);

  @override
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
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
