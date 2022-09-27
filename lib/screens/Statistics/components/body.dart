import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mining_sett/AppResponsive.dart';
import 'package:mining_sett/components/primary_user_menu.dart';
import 'package:mining_sett/localization/language/languages.dart';
import 'package:mining_sett/screens/Statistics/components/data_char.dart';
import 'package:mining_sett/screens/Statistics/components/statistics_tale.dart';
import 'package:mining_sett/screens/Statistics/components/your_miners_form.dart';
import 'package:mining_sett/screens/blog/components/body.dart';

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
    return Container(
      child: Row(
        mainAxisAlignment: screenwidth < 1300
            ? MainAxisAlignment.center
            : MainAxisAlignment.spaceBetween,
        children: [
          if (AppResponsive.isWeb(context)) ...{
            PrimaryUserMenu(
                screenwidth: screenwidth, screenheight: screenheight),
          },
          Container(
            width: screenwidth < 950 ? screenwidth : screenwidth / 1.2,
            child: SingleChildScrollView(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                SizedBox(height: 60),
                Text(
                  Languages.of(context)!.incomeStatistics,
                  style: GoogleFonts.lato(fontSize: 40),
                  textAlign: TextAlign.center,
                ),
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
                  child: DataChartFor7Days(screenwidth: screenwidth),
                ),
                SizedBox(height: 60),
                Text(
                  Languages.of(context)!.yourMinerFarm,
                  style: GoogleFonts.lato(fontSize: 40),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 60),
                FutureBuilder(
                  future: auth.get_det(),
                  builder: (context, dynamic snapshot) {
                    if (snapshot.data == null) {
                      return Container(
                        height: MediaQuery.of(context).size.height / 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/loading.gif",
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Container(
                        width: screenwidth < 950
                            ? screenwidth - 50
                            : screenwidth / 1.7,
                        child: Column(
                          children: [
                            if (AppResponsive.isMobile(context)) ...{
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  YourMinersForm(
                                    screenwidth: screenwidth,
                                    text: Languages.of(context)!.totalPower,
                                    hint: snapshot.data['minerdata'][0]
                                            ['totalPower']
                                        .toString(),
                                  ),
                                  YourMinersForm(
                                    screenwidth: screenwidth,
                                    text: Languages.of(context)!.btcPer24H,
                                    hint: ((double.parse(snapshot
                                                    .data['minerdata'][0]
                                                        ['price']
                                                    .toString()) /
                                                365) *
                                            0.13)
                                        .toString(),
                                  ),
                                ],
                              ),
                            },
                            SizedBox(height: 25),
                            if (AppResponsive.isMobile(context)) ...{
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  YourMinersForm(
                                      screenwidth: screenwidth,
                                      text: Languages.of(context)!.activeMiners,
                                      hint: snapshot.data['minerdata'][0]
                                              ['countMiner']
                                          .toString())
                                ],
                              ),
                            },
                            if (AppResponsive.isWeb(context)) ...{
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  YourMinersForm(
                                      screenwidth: screenwidth,
                                      text: Languages.of(context)!.totalPower,
                                      hint: snapshot.data['minerdata'][0]
                                              ['totalPower']
                                          .toString()),
                                  YourMinersForm(
                                    screenwidth: screenwidth,
                                    text: Languages.of(context)!.btcPer24H,
                                    hint: ((double.parse(snapshot
                                                    .data['minerdata'][0]
                                                        ['price']
                                                    .toString()) /
                                                365) *
                                            0.13)
                                        .toString(),
                                  ),
                                  YourMinersForm(
                                      screenwidth: screenwidth,
                                      text: Languages.of(context)!.activeMiners,
                                      hint: snapshot.data['minerdata'][0]
                                              ['countMiner']
                                          .toString())
                                ],
                              ),
                            },
                          ],
                        ),
                      );
                    }
                  },
                ),
                SizedBox(height: 60),
                // Text(Languages.of(context)!.statementOfIncome,
                //     textAlign: TextAlign.center,
                //     style: GoogleFonts.lato(fontSize: 40)),
                // SizedBox(height: 60),
                // StatisticsTable(screenwidth: screenwidth),
                // SizedBox(height: 60),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
