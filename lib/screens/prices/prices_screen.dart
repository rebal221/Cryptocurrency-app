import 'package:flutter/material.dart';
import 'package:mining_sett/components/home_app_bar.dart';
import 'package:mining_sett/components/side_bar.dart';
import 'package:mining_sett/screens/home/components/activte_plan_section_mobile.dart';
import 'package:mining_sett/screens/home/components/footer_scetion_Mobile.dart';
import 'package:mining_sett/screens/home/components/footer_scetion_web.dart';

class PricesScreen extends StatefulWidget {
  const PricesScreen({Key? key}) : super(key: key);
  static String routeName = "/Prices";

  @override
  State<PricesScreen> createState() => _PricesScreenState();
}

class _PricesScreenState extends State<PricesScreen> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      endDrawer: screenwidth > 950 ? null : SideBar(),
      appBar: HomeAppBar(),
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              ActivtePlanSectionMobile(),
            ],
          ),
        ),
        SizedBox(height: 30),
        FooterScetionMobile()
      ],
    ));
  }
}
