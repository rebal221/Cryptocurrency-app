import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mining_sett/AppResponsive.dart';
import 'package:mining_sett/components/app_url.dart';
import 'package:mining_sett/components/primary_user_menu.dart';
import 'package:mining_sett/constants.dart';
import 'package:mining_sett/localization/language/languages.dart';
import 'package:mining_sett/screens/Referrals/components/your_miners_form.dart';
import 'package:mining_sett/screens/blog/components/body.dart';
import 'package:mining_sett/utils/shared_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    TextEditingController referralController = TextEditingController();
    auth.getuserid().then((value) {
      referralController.text = AppUrl.host + '?id=' + value;
    });
    Future<void> _copyToClipboard() async {
      await Clipboard.setData(ClipboardData(text: referralController.text));
      showTopSnackBar(
        context,
        CustomSnackBar.success(
          message: "Link copied",
        ),
      );
    }

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
                Text(Languages.of(context)!.referralStatistics,
                    style: GoogleFonts.lato(
                        fontSize: screenwidth < 950 ? 30 : 40)),
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
                      SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(Languages.of(context)!.referralfirsttext,
                            style: GoogleFonts.lato(fontSize: 15)),
                      ),
                      SizedBox(height: 3),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(Languages.of(context)!.referralsectext,
                            style: GoogleFonts.lato(fontSize: 15)),
                      ),
                      SizedBox(height: 3),
                      Container(
                        // height: 70,
                        width: screenwidth < 950
                            ? screenwidth - 50
                            : screenwidth / 1.7,
                        color: hoverColor,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8),
                          child: Column(
                            children: [
                              if (AppResponsive.isMobile(context)) ...{
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(height: 10),
                                    Text(Languages.of(context)!.yourReferralUrl,
                                        style: GoogleFonts.lato(fontSize: 25)),
                                    SizedBox(height: 20),
                                    Container(
                                      width: 300,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.green.shade200),
                                      child: TextFormField(
                                          controller: referralController,
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            icon: IconButton(
                                              icon: Icon(Icons.copy),
                                              onPressed: _copyToClipboard,
                                            ),
                                          )),
                                    ),
                                    SizedBox(height: 10),
                                  ],
                                ),
                              },
                              if (AppResponsive.isWeb(context)) ...{
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(Languages.of(context)!.yourReferralUrl,
                                        style: GoogleFonts.lato(fontSize: 25)),
                                    Container(
                                      width: 300,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.green.shade200),
                                      child: TextFormField(
                                          controller: referralController,
                                          textAlign: TextAlign.center,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                          )),
                                    ),
                                  ],
                                ),
                              },
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                // Container(
                //   width:
                //       screenwidth < 950 ? screenwidth - 50 : screenwidth / 1.7,
                //   child: Column(
                //     children: [
                //       SizedBox(height: 25),
                //       if (AppResponsive.isMobile(context)) ...{
                //         Column(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             YourMinersForm(
                //                 screenwidth: screenwidth,
                //                 text: Languages.of(context)!.totalclicks),
                //             SizedBox(height: 15),
                //             YourMinersForm(
                //                 screenwidth: screenwidth,
                //                 text: Languages.of(context)!.totalSignups),
                //             SizedBox(height: 15),
                //             YourMinersForm(
                //                 screenwidth: screenwidth,
                //                 text: Languages.of(context)!.totalIncom),
                //             SizedBox(height: 15),
                //           ],
                //         ),
                //       },
                //       if (AppResponsive.isWeb(context)) ...{
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //           children: [
                //             YourMinersForm(
                //                 screenwidth: screenwidth,
                //                 text: Languages.of(context)!.totalclicks),
                //             YourMinersForm(
                //                 screenwidth: screenwidth,
                //                 text: Languages.of(context)!.totalSignups),
                //             YourMinersForm(
                //                 screenwidth: screenwidth,
                //                 text: Languages.of(context)!.totalIncom),
                //           ],
                //         ),
                //       },
                //     ],
                //   ),
                // ),
                SizedBox(height: 40),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
