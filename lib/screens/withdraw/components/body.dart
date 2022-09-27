import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mining_sett/AppResponsive.dart';
import 'package:mining_sett/components/defult_buy_button.dart';
import 'package:mining_sett/components/primary_user_menu.dart';
import 'package:mining_sett/components/validator.dart';
import 'package:mining_sett/constants.dart';
import 'package:mining_sett/localization/language/languages.dart';
import 'package:mining_sett/screens/blog/components/body.dart';
import 'package:mining_sett/screens/withdraw/components/withdraw_table.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.screenwidth,
    required this.screenheight,
  }) : super(key: key);

  final double screenwidth;
  final double screenheight;

  @override
  Widget build(BuildContext context) {
    TextEditingController bitCoinAddressController = TextEditingController();
    TextEditingController AmountController = TextEditingController();
    return Container(
      child: Row(
        children: [
          if (AppResponsive.isWeb(context)) ...{
            PrimaryUserMenu(
                screenwidth: screenwidth, screenheight: screenheight),
          },
          Container(
            width: screenwidth < 950 ? screenwidth : screenwidth - 300,
            child: SingleChildScrollView(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                SizedBox(height: 60),
                Text(Languages.of(context)!.withdrawYourFunds,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(fontSize: 40)),
                SizedBox(height: 40),
                Container(
                  width:
                      screenwidth < 950 ? screenwidth - 50 : screenwidth / 1.7,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade500,
                            spreadRadius: 2,
                            blurRadius: 9,
                            offset: Offset(-2, 3) // changes position of shadow
                            ),
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/bitcoin.svg',
                              height: 30.0,
                              width: 30.0,
                              allowDrawingOutsideViewBox: true,
                              color: Colors.black,
                            ),
                            SizedBox(width: 10),
                            Text(Languages.of(context)!.bitcoin,
                                style: GoogleFonts.lato(fontSize: 25)),
                          ],
                        ),
                      ),
                      horizontalLine(screenwidth / 2),
                      SizedBox(height: 20),
                      Container(
                        width: screenwidth < 950
                            ? screenwidth - 50
                            : screenwidth / 5,
                        child: Column(
                          children: [
                            Text(Languages.of(context)!.bitcoinAddress,
                                style: GoogleFonts.lato(fontSize: 20)),
                            SizedBox(height: 10),
                            Container(
                              width: 300,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.green.shade200),
                              child: TextFormField(
                                  controller: bitCoinAddressController,
                                  textAlign: TextAlign.center,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText:
                                          '1BvBMSEYstWetqTFn5Au4m4GFg7xJaNVN2')),
                            ),
                            SizedBox(height: 10),
                            Text(Languages.of(context)!.amount,
                                style: GoogleFonts.lato(fontSize: 20)),
                            SizedBox(height: 10),
                            Container(
                              width: 300,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.green.shade200),
                              child: TextFormField(
                                  controller: AmountController,
                                  textAlign: TextAlign.center,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: '0.00006')),
                            ),
                            SizedBox(height: 20),
                            Container(
                                width: screenwidth < 950
                                    ? screenwidth / 2
                                    : screenwidth / 5.3,
                                child: DefultbuttonBuy(
                                    title: Languages.of(context)!.withdrawFunds,
                                    press: () {
                                      if (AmountController.text == "") {
                                        showTopSnackBar(
                                          context,
                                          CustomSnackBar.error(
                                            message:
                                                "Please enter the withdrawal quantity to complete the process",
                                          ),
                                        );
                                      } else {
                                        if (double.parse(
                                                AmountController.text) <
                                            0.00006) {
                                          showTopSnackBar(
                                            context,
                                            CustomSnackBar.info(
                                              message:
                                                  "We are sorry that the amount of withdrawals is less than 0.00006",
                                            ),
                                          );
                                        } else {
                                          auth.add_requ(
                                              bitCoinAddressController.text,
                                              AmountController.text);
                                          showTopSnackBar(
                                            context,
                                            CustomSnackBar.success(
                                              message:
                                                  "The operation was completed successfully, you will be notified in a maximum period of 24 hour \n thank you for your trust",
                                            ),
                                          );
                                          // auth
                                          //     .withdraw(
                                          //         bitCoinAddressController.text,
                                          //         AmountController.text)
                                          //     .then((value) {
                                          // if (value) {
                                          //   // var respose = auth.emailValidation(
                                          //   //   emailController.text,
                                          //   // );
                                          //   // UserPreferences().savetypeurl('/register');

                                          //   // Navigator.pushNamed(context, OtpScreen.routeName);
                                          // } else {
                                          //   showTopSnackBar(
                                          //     context,
                                          //     CustomSnackBar.error(
                                          //       message:
                                          //           "Something went wrong. Please check your credentials and try again",
                                          //     ),
                                          //   );
                                          // }
                                          // });
                                        }
                                      }
                                    })),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 60),
                Text(Languages.of(context)!.statementOfIncome,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(fontSize: 40)),
                SizedBox(height: 40),
                WithdrawTable(screenwidth: screenwidth),
                SizedBox(height: 60),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
