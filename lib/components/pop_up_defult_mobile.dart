import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mining_sett/components/defult_buy_button.dart';
import 'package:mining_sett/components/defult_slider.dart';
import 'package:mining_sett/components/payapi.dart';
import 'package:mining_sett/constants.dart';
import 'package:mining_sett/localization/language/languages.dart';
import 'package:mining_sett/screens/blog/components/body.dart';
import 'package:mining_sett/screens/login/login.dart';
import 'package:mining_sett/screens/otp/otp_screen.dart';
import 'package:mining_sett/screens/user_dashbord/components/add_miner.dart';
import 'package:mining_sett/utils/auth_provider.dart';
import 'package:mining_sett/utils/shared_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class PopUpDefultMobile extends StatefulWidget {
  const PopUpDefultMobile({
    Key? key,
  }) : super(key: key);

  @override
  State<PopUpDefultMobile> createState() => _PopUpDefultMobileState();
}

late double r;
late double sliderController = 250;
// late double bitCoinePriceApi = 1;
// late double bitCoinePrice = 95;
late double startHashRateprice = 250;
late double endHashRateprice = 20000;
// late double gainful = 0;
final powerController = TextEditingController();
final priceController = TextEditingController();
final daelycontroller = TextEditingController();
final monthecontroller = TextEditingController();
final yearcontroller = TextEditingController();
final hashRatePrice = TextEditingController();

final hashRatePricetow = TextEditingController();

class _PopUpDefultMobileState extends State<PopUpDefultMobile> {
  double p = 1;
  String d = '';
  String m = '';
  String y = '';
  double gainful = 1;
  double bitCoinePriceApi = 1;
  AuthProvider auth = AuthProvider();
  void initState() {
    auth.get_price().then((val) async {
      setState(() {
        bitCoinePriceApi = double.parse(val['estimated_amount']);
        p = double.parse(val['estimated_amount']);
      });
      // super.initState();
    });
    auth.get_setting().then((value) {
      setState(() {
        gainful = double.parse(value['data'][0]['Income_day']);
      });
      // super.initState();
    });
  }

  @override
  Widget build(BuildContext context) {
    PayApi pay = PayApi();
    return AlertDialog(
      content: SingleChildScrollView(
        child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(LineIcons.windowClose),
                    ),
                  ],
                ),
                Container(
                    width: MediaQuery.of(context).size.width / 3.5,
                    height: MediaQuery.of(context).size.height / 5,
                    child: Image.asset(
                      'assets/images/cloudmining.gif',
                      fit: BoxFit.cover,
                    )),
                Text(Languages.of(context)!.selectdes,
                    style: GoogleFonts.quicksand(
                        textStyle: TextStyle(fontSize: 15))),
                Text(Languages.of(context)!.contractperi,
                    style: GoogleFonts.quicksand(
                        textStyle: TextStyle(fontSize: 10))),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(Languages.of(context)!.bitcoinprice,
                          style: GoogleFonts.quicksand(
                              textStyle: TextStyle(fontSize: 10))),
                    ),
                    Expanded(flex: 5, child: DefultSliderBitCoin()),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(Languages.of(context)!.hashrate,
                          style: GoogleFonts.quicksand(
                              textStyle: TextStyle(fontSize: 10))),
                    ),
                    Expanded(flex: 5, child: DefultSlider()),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(Languages.of(context)!.investmentinbitcoin,
                            style: GoogleFonts.quicksand(
                                textStyle: TextStyle(fontSize: 12))),
                        Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width / 4,
                            child: TextFormField(
                                textAlign: TextAlign.center,
                                onChanged: (value) {
                                  setState(() {
                                    powerController.text =
                                        (int.parse(value) * 95)
                                            .toStringAsFixed(0);
                                    sliderController = double.parse(value);
                                  });
                                },
                                controller: hashRatePrice,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: '250')))
                      ],
                    ),
                    Column(
                      children: [
                        Text(Languages.of(context)!.powerin,
                            style: GoogleFonts.quicksand(
                                textStyle: TextStyle(fontSize: 12))),
                        Container(
                            width: MediaQuery.of(context).size.width / 4,
                            child: TextFormField(
                                textAlign: TextAlign.center,
                                onChanged: (value) {
                                  setState(() {
                                    sliderController =
                                        (double.parse(value) / 95);
                                    hashRatePrice.text = (int.parse(value) / 95)
                                        .toStringAsFixed(0);
                                  });
                                },
                                controller: powerController,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: '0.0')))
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 7),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IncomeDefult(
                      textIncome: Languages.of(context)!.dailyincome,
                      incomecontroller: daelycontroller,
                    ),
                    IncomeDefult(
                      textIncome: Languages.of(context)!.monthlyincome,
                      incomecontroller: monthecontroller,
                    ),
                  ],
                ),
                SizedBox(height: 7),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IncomeDefult(
                      textIncome: Languages.of(context)!.yearlyinaome,
                      incomecontroller: yearcontroller,
                    )
                  ],
                ),
                SizedBox(height: 7),
                Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: DefultbuttonBuy(
                      title: Languages.of(context)!.buyButton,
                      press: () {
                        UserPreferences().savetypeurl('/Active');
                        UserPreferences().getloginsetion().then((value) async {
                          if (value == false) {
                            Navigator.pushNamed(context, Login.routeName);
                          } else {
                            auth.get_AccountUser().then((value) {
                              if (value['data']['Statue'] != 'Active') {
                                UserPreferences()
                                    .saveemailUser(value['data']['Email']);
                                Navigator.pushNamed(
                                    context, OtpScreen.routeName);
                              } else {
                                UserPreferences()
                                    .getloginsetion()
                                    .then((value) async {
                                  if (value == false) {
                                    Navigator.pushNamed(
                                        context, Login.routeName);
                                  } else {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    String user_id =
                                        prefs.getString('Id').toString();
                                    pay
                                        .createPayment(
                                            user_id,
                                            hashRatePrice.text,
                                            powerController.text)
                                        .then((val) {
                                      if (val != "false") {
                                        launch(val);
                                        showTopSnackBar(
                                          context,
                                          CustomSnackBar.success(
                                            message:
                                                "The plan has been successfully added",
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
                                                  child: Text(
                                                      "Please try again later"),
                                                ),
                                                actions: <Widget>[
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(context),
                                                    child: const Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            });
                                      }
                                    });
                                  }
                                });
                              }
                            });
                          }
                        });
                      },
                    )),
                SizedBox(height: 35),
              ],
            )),
      ),
      // actions: <Widget>[
      //   TextButton(
      //     onPressed: () => Navigator.pop(context, 'Cancel'),
      //     child: const Text('Cancel'),
      //   ),
      // ],
    );
  }

  Widget DefultSlider() {
    return Slider(
      value: sliderController > endHashRateprice
          ? endHashRateprice
          : (sliderController < startHashRateprice
              ? startHashRateprice
              : sliderController),
      onChanged: (value) {
        setState(() {
          sliderController = value;
          powerController.text = (value * 95).toStringAsFixed(0);
          hashRatePrice.text = value.toStringAsFixed(0);
          daelycontroller.text =
              ((value * gainful) / 30).toStringAsFixed(2) + ' \$';
          monthecontroller.text = (value * gainful).toStringAsFixed(1) + ' \$';
          yearcontroller.text =
              ((value * gainful) * 12).toStringAsFixed(0) + ' \$';

          d = (value * gainful).toStringAsFixed(2);
          m = (value * gainful).toStringAsFixed(1);
          y = (value * gainful).toStringAsFixed(0);
        });
      },
      min: startHashRateprice,
      max: endHashRateprice,
      activeColor: Colors.green,
      inactiveColor: Colors.green[100],
      label: sliderController.toStringAsFixed(0) + ' \$',
      divisions: endHashRateprice.toInt(),
    );
  }

  Widget DefultSliderBitCoin() {
    return Slider(
      value: bitCoinePriceApi > 100000 ? 100000 : bitCoinePriceApi,
      onChanged: (value) {
        setState(() {
          bitCoinePriceApi = value;
          // print(hashRatePrice.text);
          daelycontroller.text =
              (((double.parse(d) / p) * bitCoinePriceApi) / 30)
                      .toStringAsFixed(2) +
                  ' \$';
          monthecontroller.text =
              ((double.parse(m) / p) * bitCoinePriceApi).toStringAsFixed(1) +
                  ' \$';
          yearcontroller.text =
              (((double.parse(d) / p) * bitCoinePriceApi) * 12)
                      .toStringAsFixed(2) +
                  ' \$';
        });
      },
      min: 1,
      max: 100000,
      activeColor: Colors.amber,
      inactiveColor: Colors.amber[200],
      label: bitCoinePriceApi.round().toString() + ' \$',
      divisions: 100000,
    );
  }
}

class IncomeDefult extends StatelessWidget {
  const IncomeDefult({
    Key? key,
    required this.incomecontroller,
    required this.textIncome,
  }) : super(key: key);
  final TextEditingController incomecontroller;
  final String textIncome;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
            width: 1, //                   <--- border width here
            color: Colors.grey.shade500),
      ),
      child: Column(
        children: [
          Text(textIncome,
              style: GoogleFonts.quicksand(textStyle: TextStyle(fontSize: 12))),
          Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width / 4,
              child: TextFormField(
                  textAlign: TextAlign.center,
                  style: TextStyle(color: kPrimaryColor, fontSize: 12),
                  controller: incomecontroller,
                  decoration: const InputDecoration(
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  )))
        ],
      ),
    );
  }
}
