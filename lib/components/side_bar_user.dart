import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mining_sett/components/custom_menu.dart';
import 'package:mining_sett/components/custom_user_buttons.dart';
import 'package:mining_sett/components/item_user_menu_user.dart';
import 'package:mining_sett/constants.dart';
import 'package:mining_sett/localization/language/language_data.dart';
import 'package:mining_sett/localization/language/languages.dart';
import 'package:mining_sett/localization/locale_constant.dart';
import 'package:mining_sett/screens/FQS/faq_screen.dart';
import 'package:mining_sett/screens/Referrals/referrals_screen.dart';
import 'package:mining_sett/screens/Statistics/statistics_screen.dart';
import 'package:mining_sett/screens/account/account_screen.dart';
import 'package:mining_sett/screens/contact_us/contact_us_sceen.dart';
import 'package:mining_sett/screens/home/home_screen.dart';
import 'package:mining_sett/screens/prices/prices_screen.dart';
import 'package:mining_sett/screens/term/term_screen.dart';
import 'package:mining_sett/screens/user_dashbord/user_dashord_screen.dart';
import 'package:mining_sett/screens/withdraw/withdraw_screen.dart';
import 'package:mining_sett/utils/shared_preference.dart';

import '../AppResponsive.dart';

class SideBarUser extends StatefulWidget {
  const SideBarUser({Key? key}) : super(key: key);

  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBarUser> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: SingleChildScrollView(
        child: Container(
          color: kPrimaryColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Text(
                  "SHAMINING",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              horizontalLine(200),
              // Spacer(flex: 3),
              Container(
                alignment: Alignment.topCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if (AppResponsive.isMobile(context)) ...{
                      SizedBox(height: 20),
                      pageTitleMobile(
                        title: Languages.of(context)!.titleHome,
                        press: () {
                          Navigator.pushNamed(context, HomeScreen.routeName);
                        },
                      ),
                      SizedBox(height: 20),
                      pageTitleMobile(
                        title: Languages.of(context)!.titlePrices,
                        press: () {
                          Navigator.pushNamed(context, PricesScreen.routeName);
                        },
                      ),
                      SizedBox(height: 20),
                      UserMenuItemsUser(
                        text: Languages.of(context)!.miners,
                        press: () {
                          Navigator.pushNamed(context, UserDashbord.routeName);
                        },
                      ),
                      SizedBox(height: 20),
                      UserMenuItemsUser(
                        text: Languages.of(context)!.statistics,
                        press: () {
                          Navigator.pushNamed(context, Statistics.routeName);
                        },
                      ),
                      SizedBox(height: 20),
                      UserMenuItemsUser(
                        text: Languages.of(context)!.referrals,
                        press: () {
                          Navigator.pushNamed(context, Referrals.routeName);
                        },
                      ),
                      SizedBox(height: 20),
                      UserMenuItemsUser(
                        text: Languages.of(context)!.withdraw,
                        press: () {
                          Navigator.pushNamed(context, Withdraw.routeName);
                        },
                      ),
                      SizedBox(height: 20),
                      UserMenuItemsUser(
                        text: Languages.of(context)!.account,
                        press: () {
                          Navigator.pushNamed(context, Account.routeName);
                        },
                      ),
                      SizedBox(height: 20),
                      pageTitleMobile(
                        title: Languages.of(context)!.titleContactUs,
                        press: () {
                          Navigator.pushNamed(
                              context, ContactUsScreen.routeName);
                        },
                      ),
                      SizedBox(height: 20),
                      pageTitleMobile(
                        title: Languages.of(context)!.titleHowITWork,
                        press: () {
                          Navigator.pushNamed(context, FAQ.routeName);
                        },
                      ),
                      SizedBox(height: 20),
                      pageTitleMobile(
                        title: Languages.of(context)!.titleterm,
                        press: () {
                          Navigator.pushNamed(context, Term.routeName);
                        },
                      ),
                      SizedBox(height: 20),
                      UserMenuItemsUser(
                        text: Languages.of(context)!.signout,
                        press: () {
                          UserPreferences().removeEmail2();
                          UserPreferences().removeEmail3();

                          Navigator.pushNamed(context, HomeScreen.routeName);
                        },
                      ),
                    },
                    SizedBox(height: 20),
                  ],
                ),
              ),

              Container(
                width: 150,
                child: Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child: FutureBuilder(
                      future: UserPreferences().getloginsetion(),
                      builder: (context, snapshot) {
                        if (snapshot.data == false) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              LoginButton(),
                              SizedBox(width: 20),
                              RejesterButton()
                            ],
                          );
                        } else {
                          return Container(
                            // height: 30,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade700,
                                    spreadRadius: 2,
                                    blurRadius: 9,
                                    offset: const Offset(
                                        -2, 3) // changes position of shadow
                                    ),
                              ],
                            ),
                            // ignore: deprecated_member_use
                            child: FlatButton(
                              splashColor: kPrimaryColor,
                              color: Colors.amber.shade400,
                              textColor: Colors.white,
                              child: Row(
                                // Replace with a Row for horizontal icon + text
                                children: <Widget>[
                                  const Icon(LineIcons.home),
                                  const SizedBox(width: 5),
                                  FutureBuilder(
                                    future: UserPreferences().getUser(),
                                    builder: (context, dynamic snapshot) {
                                      if (snapshot.data == null) {
                                        return const Text('');
                                      } else {
                                        return Text(
                                          snapshot.data.Name.toString(),
                                          style: GoogleFonts.lato(
                                              textStyle: const TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white)),
                                        );
                                      }
                                    },
                                  ),
                                ],
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, UserDashbord.routeName);
                              },
                            ),
                          );
                        }
                      },
                    )),
              ),
              SizedBox(height: 15),
              buttonlangauage(),

              Container(
                height: MediaQuery.of(context).size.width / 4,
                width: MediaQuery.of(context).size.height / 3,
                child: SvgPicture.asset(
                  'assets/images/Logo.svg',
                  // color: Colors.white,
                ),
              ),
              horizontalLine(200),
              Text(
                '2021 © SHAMINING, All Rights Reserved',
                style: GoogleFonts.quicksand(
                    textStyle: TextStyle(fontSize: 14, color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding buttonlangauage() {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: Container(
        height: 29,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 1, //                   <--- border width here
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<LanguageData>(
              iconSize: 40,
              style: TextStyle(fontSize: 16, color: kPrimaryColor),
              icon: Icon(Icons.arrow_drop_down, size: 25, color: Colors.white),
              iconEnabledColor: kPrimaryColor,
              onChanged: (language) {
                changeLanguage(context, language!.languageCode);
              },
              items: LanguageData.languageList()
                  .map<DropdownMenuItem<LanguageData>>(
                    (e) => DropdownMenuItem<LanguageData>(
                      value: e,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: 30,
                            height: 30,
                            child: SvgPicture.asset(
                              e.flag,
                              height: 30.0,
                              width: 30.0,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                          // Text(
                          //   e.flag,
                          //   style: TextStyle(fontSize: 20),
                          // ),
                          Text(e.name)
                        ],
                      ),
                    ),
                  )
                  .toList(),
              hint: Text(
                Languages.of(context)!.titleLan,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final String title;
  final VoidCallback press;

  const DrawerListTile({Key? key, required this.title, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      // leading: Image.asset(
      //   icon,
      //   color: Colors.white,
      //   height: 16,
      // ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
