import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mining_sett/components/defult_accordeno.dart';
import 'package:mining_sett/components/defult_button.dart';
import 'package:mining_sett/components/defult_buy_button.dart';
import 'package:mining_sett/localization/language/languages.dart';
import 'package:mining_sett/screens/FQS/faq_screen.dart';

class FAQSection extends StatelessWidget {
  const FAQSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;

    return Container(
      width: size,
      color: size < 900 ? Colors.green.shade100 : Colors.white30,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 40),
          Text(
            'FAQ',
            style: GoogleFonts.quicksand(
                textStyle: TextStyle(fontSize: 25, color: Colors.black),
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 40),
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
          SizedBox(height: 40),
          Container(
            child: DefultbuttonBuy(
                title: Languages.of(context)!.moreButton,
                press: () {
                  Navigator.pushNamed(context, FAQ.routeName);
                }),
            width: size > 900
                ? MediaQuery.of(context).size.width / 6
                : MediaQuery.of(context).size.width / 3,
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
