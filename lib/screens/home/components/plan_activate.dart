import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mining_sett/components/defult_button.dart';
import 'package:mining_sett/components/defult_buy_button.dart';
import 'package:mining_sett/components/payapi.dart';
import 'package:mining_sett/constants.dart';
import 'package:mining_sett/localization/language/languages.dart';
import 'package:mining_sett/screens/blog/components/body.dart';
import 'package:mining_sett/screens/login/login.dart';
import 'package:mining_sett/screens/user_dashbord/user_dashord_screen.dart';
import 'package:mining_sett/utils/shared_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class PlanActive extends StatelessWidget {
  const PlanActive({
    Key? key,
    required this.text,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.text5,
    required this.dec1,
    required this.dec2,
    required this.dec3,
    required this.dec4,
    required this.dec5,
    required this.image,
  }) : super(key: key);
  final String text;
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final String text5;
  final String dec1;
  final String dec2;
  final String dec3;
  final String dec4;
  final String dec5;
  final String image;

  @override
  Widget build(BuildContext context) {
    PayApi pay = PayApi();
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
              height: MediaQuery.of(context).size.height / 6,
              padding: EdgeInsets.only(top: 20, bottom: 20),
              decoration: BoxDecoration(
                // color: Colors.red,
                image: DecorationImage(
                  image: AssetImage(image),
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
                text,
                style: GoogleFonts.quicksand(
                    textStyle: TextStyle(fontSize: 20, color: Colors.white)),
              ),
            ),
            horizontalLine(MediaQuery.of(context).size.width - 100),
            PlanDec(titleText: text1, decText: dec1),
            horizontalLine(MediaQuery.of(context).size.width - 100),
            PlanDec(titleText: text2, decText: dec2),
            horizontalLine(MediaQuery.of(context).size.width - 100),
            PlanDec(titleText: text3, decText: dec3),
            horizontalLine(MediaQuery.of(context).size.width - 100),
            PlanDec(titleText: text4, decText: dec4),
            horizontalLine(MediaQuery.of(context).size.width - 100),
            PlanDec(titleText: text5, decText: dec5),
            horizontalLine(MediaQuery.of(context).size.width - 100),
            DefultbuttonBuy(
                title: Languages.of(context)!.buyButton,
                press: () {
                  UserPreferences().getloginsetion().then((value) async {
                    if (value == false) {
                      Navigator.pushNamed(context, Login.routeName);
                    } else {
                      String price =
                          (double.parse(dec2) / 95).toStringAsFixed(0);
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      String user_id = prefs.getString('Id').toString();
                      pay.createPayment(user_id, price, dec2).then((val) {
                        if (val != "false") {
                          launch(val);
                          showTopSnackBar(
                            context,
                            CustomSnackBar.success(
                              message: "The plan has been successfully added",
                            ),
                          );
                        } else {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: Colors.white,
                                  content: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text("Please try again later"),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('Ok'),
                                    ),
                                  ],
                                );
                              });
                        }
                      });
                    }
                  });
                })
          ],
        ),
      ),
    );
  }
}

class PlanDec extends StatelessWidget {
  const PlanDec({
    Key? key,
    required this.titleText,
    required this.decText,
  }) : super(key: key);
  final String titleText;
  final String decText;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        SizedBox(
          height: 8,
        ),
        Text(
          titleText,
          style: GoogleFonts.quicksand(textStyle: TextStyle(fontSize: 13)),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          decText,
          style: GoogleFonts.quicksand(
              textStyle: TextStyle(fontSize: 15, color: Colors.black)),
        ),
        SizedBox(
          height: 8,
        ),
      ],
    ));
  }
}
