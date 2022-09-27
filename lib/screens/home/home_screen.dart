import 'package:flutter/material.dart';
import 'package:mining_sett/components/home_app_bar.dart';
import 'package:mining_sett/components/side_bar.dart';
import 'package:mining_sett/screens/home/components/body.dart';
import 'package:mining_sett/utils/auth_provider.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      endDrawer: screenWidth > 950 ? null : SideBar(),
      appBar: HomeAppBar(),
      body: Body(),
    );
  }
}
// 