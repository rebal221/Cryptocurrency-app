import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mining_sett/components/defult_accordeno.dart';
import 'package:mining_sett/components/home_app_bar.dart';
import 'package:mining_sett/components/side_bar.dart';
import 'package:mining_sett/components/side_bar_user.dart';
import 'package:mining_sett/localization/language/languages.dart';
import 'package:mining_sett/screens/home/components/footer_scetion_Mobile.dart';
import 'package:mining_sett/screens/home/components/footer_scetion_web.dart';

class FAQ extends StatelessWidget {
  const FAQ({Key? key}) : super(key: key);
  static String routeName = "/FAQ";

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
                height: 20,
              ),
              Defult_accordone(
                qusetion: Languages.of(context)!.question1,
                Answer: Languages.of(context)!.answer1,
              ),
              SizedBox(height: 40),
              Defult_accordone(
                qusetion: Languages.of(context)!.question2,
                Answer: Languages.of(context)!.answer2,
              ),
              SizedBox(height: 40),
              Defult_accordone(
                qusetion: Languages.of(context)!.question3,
                Answer: Languages.of(context)!.answer3,
              ),
              SizedBox(height: 40),
              Defult_accordone(
                qusetion: Languages.of(context)!.question4,
                Answer: Languages.of(context)!.answer4,
              ),
              SizedBox(height: 40),
              Defult_accordone(
                qusetion: Languages.of(context)!.question5,
                Answer: Languages.of(context)!.answer5,
              ),
            ],
          ),
        ),
        SizedBox(height: 30),
        MediaQuery.of(context).size.width < 900
            ? FooterScetionMobile()
            : FooterScetionWeb()
      ],
    ));
  }
}
