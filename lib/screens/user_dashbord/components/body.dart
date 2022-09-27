import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mining_sett/AppResponsive.dart';
import 'package:mining_sett/components/defult_buy_button.dart';
import 'package:mining_sett/components/primary_user_menu.dart';
import 'package:mining_sett/localization/language/languages.dart';
import 'package:mining_sett/screens/blog/components/body.dart';
import 'package:mining_sett/screens/user_dashbord/components/add_miner.dart';
import 'package:mining_sett/screens/user_dashbord/components/data_char.dart';
import 'package:mining_sett/screens/user_dashbord/components/miner.dart';
import 'package:mining_sett/screens/user_dashbord/components/wait_maine.dart';
import 'package:mining_sett/screens/user_dashbord/components/your_miners_form.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
    required this.screenwidth,
    required this.screenheight,
  }) : super(key: key);

  final double screenwidth;
  final double screenheight;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: widget.screenwidth < 1300
            ? MainAxisAlignment.center
            : MainAxisAlignment.spaceBetween,
        children: [
          if (AppResponsive.isWeb(context)) ...{
            PrimaryUserMenu(
                screenwidth: widget.screenwidth,
                screenheight: widget.screenheight),
          },
          SingleChildScrollView(
            child: Padding(
              padding:
                  EdgeInsets.only(left: widget.screenwidth < 950 ? 0 : 13.0),
              child: Container(
                width: widget.screenwidth < 950
                    ? widget.screenwidth
                    : widget.screenwidth / 1.4,
                child: Container(
                  alignment: Alignment.topLeft,
                  width: widget.screenwidth < 950
                      ? widget.screenwidth
                      : widget.screenwidth / 1.4,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 60),
                        Text(Languages.of(context)!.yourMiner,
                            style: GoogleFonts.lato(fontSize: 30)),
                        SizedBox(height: 40),
                        Container(
                          width: widget.screenwidth < 1100
                              ? widget.screenwidth
                              : widget.screenwidth / 1.7,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade500,
                                    spreadRadius: 2,
                                    blurRadius: 9,
                                    offset: Offset(
                                        -2, 3) // changes position of shadow
                                    ),
                              ],
                              borderRadius: BorderRadius.circular(10)),
                          child: FutureBuilder(
                            future: auth.get_miners(),
                            builder: (context, dynamic snapshot) {
                              if (snapshot.data == null) {
                                return Container(
                                  height:
                                      MediaQuery.of(context).size.height / 2,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/loading.gif",
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                return Column(
                                  children: [
                                    SizedBox(height: 35),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        snapshot.data.length >= 1
                                            ? (snapshot.data[0]['Statue'] ==
                                                    'Pending'
                                                ? WaitMiner(
                                                    pay_Id: snapshot.data[0]
                                                        ['Id'])
                                                : Miner(
                                                    textone: snapshot.data[0]
                                                            ['Hash_Rate'] +
                                                        ' GH/S',
                                                    texttow: snapshot.data[0]
                                                        ['End_Date'],
                                                    image:
                                                        'assets/images/gpu1.1.gif'))
                                            : AddMiners(),
                                        snapshot.data.length >= 2
                                            ? (snapshot.data[1]['Statue'] ==
                                                    'Pending'
                                                ? WaitMiner(
                                                    pay_Id: snapshot.data[1]
                                                        ['Id'])
                                                : Miner(
                                                    textone: snapshot.data[1]
                                                            ['Hash_Rate'] +
                                                        ' GH/S',
                                                    texttow: snapshot.data[1]
                                                        ['End_Date'],
                                                    image:
                                                        'assets/images/gpu1.1.gif'))
                                            : AddMiners(),
                                        snapshot.data.length >= 3
                                            ? (snapshot.data[2]['Statue'] ==
                                                    'Pending'
                                                ? WaitMiner(
                                                    pay_Id: snapshot.data[2]
                                                        ['Id'])
                                                : Miner(
                                                    textone: snapshot.data[2]
                                                            ['Hash_Rate'] +
                                                        ' GH/S',
                                                    texttow: snapshot.data[2]
                                                        ['End_Date'],
                                                    image:
                                                        'assets/images/gpu1.1.gif'))
                                            : AddMiners(),
                                      ],
                                    ),
                                    SizedBox(height: 35),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        snapshot.data.length >= 4
                                            ? (snapshot.data[3]['Statue'] ==
                                                    'Pending'
                                                ? WaitMiner(
                                                    pay_Id: snapshot.data[3]
                                                        ['Id'])
                                                : Miner(
                                                    textone: snapshot.data[3]
                                                            ['Hash_Rate'] +
                                                        ' GH/S',
                                                    texttow: snapshot.data[3]
                                                        ['End_Date'],
                                                    image:
                                                        'assets/images/gpu1.1.gif'))
                                            : AddMiners(),
                                        snapshot.data.length >= 5
                                            ? (snapshot.data[4]['Statue'] ==
                                                    'Pending'
                                                ? WaitMiner(
                                                    pay_Id: snapshot.data[4]
                                                        ['Id'])
                                                : Miner(
                                                    textone: snapshot.data[4]
                                                            ['Hash_Rate'] +
                                                        ' GH/S',
                                                    texttow: snapshot.data[4]
                                                        ['End_Date'],
                                                    image:
                                                        'assets/images/gpu1.1.gif'))
                                            : AddMiners(),
                                        snapshot.data.length >= 6
                                            ? (snapshot.data[5]['Statue'] ==
                                                    'Pending'
                                                ? WaitMiner(
                                                    pay_Id: snapshot.data[5]
                                                        ['Id'])
                                                : Miner(
                                                    textone: snapshot.data[5]
                                                            ['Hash_Rate'] +
                                                        ' GH/S',
                                                    texttow: snapshot.data[5]
                                                        ['End_Date'],
                                                    image:
                                                        'assets/images/gpu1.1.gif'))
                                            : AddMiners(),
                                      ],
                                    ),
                                    SizedBox(height: 35),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        snapshot.data.length >= 7
                                            ? (snapshot.data[6]['Statue'] ==
                                                    'Pending'
                                                ? WaitMiner(
                                                    pay_Id: snapshot.data[6]
                                                        ['Id'])
                                                : Miner(
                                                    textone: snapshot.data[6]
                                                            ['Hash_Rate'] +
                                                        ' GH/S',
                                                    texttow: snapshot.data[6]
                                                        ['End_Date'],
                                                    image:
                                                        'assets/images/gpu1.1.gif'))
                                            : AddMiners(),
                                        snapshot.data.length >= 8
                                            ? (snapshot.data[7]['Statue'] ==
                                                    'Pending'
                                                ? WaitMiner(
                                                    pay_Id: snapshot.data[7]
                                                        ['Id'])
                                                : Miner(
                                                    textone: snapshot.data[7]
                                                            ['Hash_Rate'] +
                                                        ' GH/S',
                                                    texttow: snapshot.data[7]
                                                        ['End_Date'],
                                                    image:
                                                        'assets/images/gpu1.1.gif'))
                                            : AddMiners(),
                                        snapshot.data.length >= 9
                                            ? (snapshot.data[8]['Statue'] ==
                                                    'Pending'
                                                ? WaitMiner(
                                                    pay_Id: snapshot.data[8]
                                                        ['Id'])
                                                : Miner(
                                                    textone: snapshot.data[8]
                                                            ['Hash_Rate'] +
                                                        ' GH/S',
                                                    texttow: snapshot.data[8]
                                                        ['End_Date'],
                                                    image:
                                                        'assets/images/gpu1.1.gif'))
                                            : AddMiners(),
                                      ],
                                    ),
                                    SizedBox(height: 35),
                                    Container(
                                        width: widget.screenwidth < 950
                                            ? widget.screenwidth / 2
                                            : widget.screenwidth / 4,
                                        child: DefultbuttonBuy(
                                            title:
                                                Languages.of(context)!.addMiner,
                                            press: () {})),
                                    SizedBox(height: 35),
                                  ],
                                );
                              }
                            },
                          ),
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
                                width: widget.screenwidth < 950
                                    ? widget.screenwidth - 50
                                    : widget.screenwidth / 1.7,
                                child: Column(
                                  children: [
                                    if (AppResponsive.isMobile(context)) ...{
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          YourMinersForm(
                                              screenwidth: widget.screenwidth,
                                              text: Languages.of(context)!
                                                  .minerCount,
                                              hint: snapshot.data['minerdata']
                                                      [0]['countMiner']
                                                  .toString()),
                                          YourMinersForm(
                                              screenwidth: widget.screenwidth,
                                              text: Languages.of(context)!
                                                  .totalPower,
                                              hint: snapshot.data['minerdata']
                                                      [0]['totalPower']
                                                  .toString()),
                                        ],
                                      ),
                                    },
                                    if (AppResponsive.isMobile(context)) ...{
                                      SizedBox(height: 30),
                                    },
                                    if (AppResponsive.isMobile(context)) ...{
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          YourMinersForm(
                                              screenwidth: widget.screenwidth,
                                              text: Languages.of(context)!
                                                  .yourBalance,
                                              hint: snapshot.data['Balance'][0]
                                                      ['Balance']
                                                  .toString()),
                                        ],
                                      ),
                                    },
                                    if (AppResponsive.isWeb(context)) ...{
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          YourMinersForm(
                                              screenwidth: widget.screenwidth,
                                              text: Languages.of(context)!
                                                  .minerCount,
                                              hint: snapshot.data['minerdata']
                                                      [0]['countMiner']
                                                  .toString()),
                                          YourMinersForm(
                                              screenwidth: widget.screenwidth,
                                              text: Languages.of(context)!
                                                  .totalPower,
                                              hint: snapshot.data['minerdata']
                                                      [0]['totalPower']
                                                  .toString()),
                                          YourMinersForm(
                                              screenwidth: widget.screenwidth,
                                              text: Languages.of(context)!
                                                  .yourBalance,
                                              hint: snapshot.data['Balance'][0]
                                                      ['Balance']
                                                  .toString())
                                        ],
                                      ),
                                    }
                                  ],
                                ),
                              );
                            }
                          },
                        ),
                        SizedBox(height: 60),
                        Text(
                          Languages.of(context)!.income7day,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(fontSize: 40),
                        ),
                        SizedBox(height: 60),
                        DataChartFor7Days(screenwidth: widget.screenwidth),
                        SizedBox(height: 60),
                      ]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
