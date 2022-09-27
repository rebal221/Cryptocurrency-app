import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mining_sett/components/defult_buy_button.dart';
import 'package:mining_sett/components/defult_slider%20copy.dart';
import 'package:mining_sett/constants.dart';
import 'package:mining_sett/localization/language/languages.dart';
import 'package:mining_sett/screens/home/components/plan_activate.dart';
import 'package:mining_sett/screens/login/login.dart';
import 'package:mining_sett/screens/user_dashbord/user_dashord_screen.dart';
import 'package:mining_sett/utils/shared_preference.dart';

class ActivtePlanSectionMobile extends StatefulWidget {
  const ActivtePlanSectionMobile({
    Key? key,
  }) : super(key: key);

  @override
  State<ActivtePlanSectionMobile> createState() =>
      _ActivtePlanSectionMobileState();
}

final power = TextEditingController();
double _currentSliderValue = 950000;

class _ActivtePlanSectionMobileState extends State<ActivtePlanSectionMobile> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 0),
        // height: 600,
        width: MediaQuery.of(context).size.width - 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color: hoverColor,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade700,
                spreadRadius: 2,
                blurRadius: 9,
                offset: Offset(-2, 3) // changes position of shadow
                ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              PlanActive(
                image: 'assets/images/gpu1.1.gif',
                text: Languages.of(context)!.plan1Title,
                text1: Languages.of(context)!.planText1,
                text2: Languages.of(context)!.planText2,
                text3: Languages.of(context)!.planText3,
                text4: Languages.of(context)!.planText4,
                text5: Languages.of(context)!.planText5,
                dec1: Languages.of(context)!.plandes1,
                dec2: '23750',
                dec3: '0.010',
                dec4: 'From 13%',
                dec5: Languages.of(context)!.planText5,
              ),
              PlanActive(
                image: 'assets/images/gpu2.gif',
                text: Languages.of(context)!.plan2Title,
                text1: Languages.of(context)!.planText1,
                text2: Languages.of(context)!.planText2,
                text3: Languages.of(context)!.planText3,
                text4: Languages.of(context)!.planText4,
                text5: Languages.of(context)!.planText5,
                dec1: Languages.of(context)!.plandes1,
                dec2: '95000',
                dec3: '0.010',
                dec4: 'From 13%',
                dec5: Languages.of(context)!.plandes5,
              ),
              SizedBox(height: 15),
              horizontalLine(MediaQuery.of(context).size.width - 200),
              SizedBox(height: 15),
              PlanActive(
                image: 'assets/images/gpu3.gif',
                text: Languages.of(context)!.plan3Title,
                text1: Languages.of(context)!.planText1,
                text2: Languages.of(context)!.planText2,
                text3: Languages.of(context)!.planText3,
                text4: Languages.of(context)!.planText4,
                text5: Languages.of(context)!.planText5,
                dec1: Languages.of(context)!.plandes1,
                dec2: '950000',
                dec3: '0.010',
                dec4: 'From 13%',
                dec5: Languages.of(context)!.plandes5,
              ),
              palnfour()
            ],
          ),
        ),
      ),
    );
  }

  Widget palnfour() {
    double screenwidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        width: screenwidth / 1.5,
        decoration: BoxDecoration(
          color: hoverColor,
        ),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 10,
              padding: EdgeInsets.only(top: 20, bottom: 20),
              decoration: BoxDecoration(
                // color: Colors.red,
                image: DecorationImage(
                  image: AssetImage('assets/images/question_mark.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 45,
              width: MediaQuery.of(context).size.width - 10,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                Languages.of(context)!.plan4Title,
                style: GoogleFonts.quicksand(
                    textStyle: TextStyle(fontSize: 20, color: Colors.white)),
              ),
            ),
            horizontalLine(MediaQuery.of(context).size.width - 100),
            PlanDec(
                titleText: Languages.of(context)!.planText1,
                decText: Languages.of(context)!.plandes1),
            horizontalLine(MediaQuery.of(context).size.width - 100),
            PlanDec(
                titleText: Languages.of(context)!.planText2,
                decText: power.text),
            horizontalLine(MediaQuery.of(context).size.width - 100),
            PlanDec(
                titleText: Languages.of(context)!.planText3,
                decText: '0.18 \$'),
            horizontalLine(MediaQuery.of(context).size.width - 100),
            Slider(
              value: _currentSliderValue > 1900000
                  ? 1900000
                  : (_currentSliderValue < 950000
                      ? 950000
                      : _currentSliderValue),
              min: 950000,
              max: 1900000,
              divisions: 20000,
              label: _currentSliderValue.round().toString() + 'GH/s',
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                  power.text = value.toStringAsFixed(0);
                });
              },
            ),
            horizontalLine(MediaQuery.of(context).size.width - 100),
            PlanDec(
                titleText: Languages.of(context)!.planText5, decText: 'YES'),
            horizontalLine(MediaQuery.of(context).size.width - 100),
            DefultbuttonBuy(
                title: Languages.of(context)!.buyButton,
                press: () {
                  UserPreferences().getloginsetion().then((value) async {
                    if (value == false) {
                      Navigator.pushNamed(context, Login.routeName);
                    } else {
                      Navigator.pushNamed(context, UserDashbord.routeName);
                    }
                  });
                })
          ],
        ),
      ),
    );
  }
}
