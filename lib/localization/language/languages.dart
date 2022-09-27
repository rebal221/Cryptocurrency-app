import 'package:flutter/material.dart';
import 'package:mining_sett/screens/register/register.dart';

abstract class Languages {
  static Languages? of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages);
  }

  String get updatepassword;

  String get titleLan;

  String get titleHome;

  String get titleBlog;

  String get titlePrices;

  String get titleContactUs;

  String get titleHowITWork;

  String get titleterm;

  String get login;

  String get register;

  String get cloudMining;

  String get platForm;

  String get homeSectiontext;

  String get calculateIncomeButton;

  String get howDoStarted;

  String get howDoOnetitle;

  String get howDoTowtitle;

  String get howDoThreetitle;

  String get howDoOnedes;

  String get howDoTowdes;

  String get howDoThreedes;

  String get plan1Title;

  String get plan2Title;

  String get plan3Title;

  String get plan4Title;

  String get planText1;

  String get planText2;

  String get planText3;

  String get planText4;

  String get planText5;

  String get plandes1;

  String get plandes5;

  String get buyButton;

  String get whatIsTitle1;

  String get whatIsTitle2;

  String get whatIsTitle3;

  String get whatIsDes1;

  String get whatIsDes2;

  String get whatIsDes3;

  String get downloadAndroid;

  String get downloadIos;

  String get downloadWindows;

  String get question1;

  String get question2;

  String get question3;

  String get question4;

  String get question5;

  String get answer1;

  String get answer2;

  String get answer3;

  String get answer4;

  String get answer5;

  String get moreButton;

  String get miners;

  String get statistics;

  String get referrals;

  String get withdraw;

  String get account;

  String get signout;

  String get yourMiner;

  String get addMiner;

  String get yourMinerFarm;

  String get minerCount;

  String get totalPower;

  String get yourBalance;

  String get income7day;

  String get pleaseWait;

  String get incomeStatistics;

  String get btcPer24H;

  String get activeMiners;

  String get statementOfIncome;

  String get date;

  String get decription;

  String get amount;

  String get referralStatistics;

  String get referralfirsttext;

  String get referralsectext;

  String get yourReferralUrl;

  String get totalclicks;

  String get totalSignups;

  String get totalIncom;

  String get withdrawYourFunds;

  String get bitcoin;

  String get bitcoinAddress;

  String get withdrawFunds;

  String get address;

  String get status;

  String get indentityver;

  String get yourIndetity;

  String get email;

  String get phone;

  String get name;

  String get password;

  String get updateAccount;

  String get logindes;

  String get donthave;

  String get forgotpassword;

  String get signin;

  String get forgotpasswordtitle;

  String get forgotpassworddes;

  String get submit;

  String get welcome;

  String get signupdes;

  String get reemail;

  String get repass;

  String get byregester;

  String get codever;

  String get otpdec;

  String get codehasbeen;

  String get pressto;

  String get verification;

  String get resetpass;

  String get reseetpassdes;

  String get newpass;

  String get selectdes;

  String get contractperi;

  String get bitcoinprice;

  String get hashrate;

  String get investmentinbitcoin;

  String get powerin;

  String get dailyincome;

  String get monthlyincome;

  String get yearlyinaome;

  String get faq;

  String get whoweare;

  String get whoweanser;

  String get doyouhave;

  String get doyouhaveanser;

  String get termLink;

  String get yourIndetityfalse;

  // String get postsuccess;

  // String get posterror1;

  // String get posterror2;
}
