import 'package:flutter/material.dart';
import 'package:mining_sett/components/item_user_menu.dart';
import 'package:mining_sett/localization/language/languages.dart';
import 'package:mining_sett/screens/Referrals/referrals_screen.dart';
import 'package:mining_sett/screens/Statistics/statistics_screen.dart';
import 'package:mining_sett/screens/account/account_screen.dart';
import 'package:mining_sett/screens/home/home_screen.dart';
import 'package:mining_sett/screens/user_dashbord/user_dashord_screen.dart';
import 'package:mining_sett/screens/withdraw/withdraw_screen.dart';
import 'package:mining_sett/utils/shared_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrimaryUserMenu extends StatelessWidget {
  const PrimaryUserMenu({
    Key? key,
    required this.screenwidth,
    required this.screenheight,
  }) : super(key: key);

  final double screenwidth;
  final double screenheight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenwidth / 6,
      height: screenheight,
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
      ),
      child: Column(
        children: [
          SizedBox(height: 10),
          UserMenuItemsWeb(
            text: Languages.of(context)!.miners,
            icon: 'assets/images/home.png',
            press: () {
              Navigator.pushNamed(context, UserDashbord.routeName);
            },
          ),
          SizedBox(height: 5),
          UserMenuItemsWeb(
            text: Languages.of(context)!.statistics,
            icon: 'assets/images/data.png',
            press: () {
              Navigator.pushNamed(context, Statistics.routeName);
            },
          ),
          SizedBox(height: 5),
          UserMenuItemsWeb(
            text: Languages.of(context)!.referrals,
            icon: 'assets/images/link.png',
            press: () {
              Navigator.pushNamed(context, Referrals.routeName);
            },
          ),
          SizedBox(height: 5),
          UserMenuItemsWeb(
            text: Languages.of(context)!.withdraw,
            icon: 'assets/images/wallet.png',
            press: () {
              Navigator.pushNamed(context, Withdraw.routeName);
            },
          ),
          SizedBox(height: 5),
          UserMenuItemsWeb(
            text: Languages.of(context)!.account,
            icon: 'assets/images/user.png',
            press: () {
              Navigator.pushNamed(context, Account.routeName);
            },
          ),
          SizedBox(height: 70),
          UserMenuItemsWeb(
            text: Languages.of(context)!.signout,
            icon: 'assets/images/logout.png',
            press: () async {
              UserPreferences().removeEmail2();
              UserPreferences().removeEmail3();

              Navigator.pushNamed(context, HomeScreen.routeName);
            },
          ),
          Spacer(),
          Text('© SHAMINING'),
        ],
      ),
    );
  }
}
