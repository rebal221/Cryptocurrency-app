import 'package:flutter/widgets.dart';
import 'screens/FQS/faq_screen.dart';
import 'screens/Referrals/referrals_screen.dart';
import 'screens/Statistics/statistics_screen.dart';
import 'screens/account/account_screen.dart';
import 'screens/blog/blog_screen.dart';
import 'screens/contact_us/contact_us_sceen.dart';
import 'screens/forgot_password/forgot_password_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/login/login.dart';
import 'screens/otp/otp_screen.dart';
import 'screens/prices/prices_screen.dart';
import 'screens/register/register.dart';
import 'screens/reste_password/reste_password_screen.dart';
import 'screens/term/term_screen.dart';
import 'screens/user_dashbord/user_dashord_screen.dart';
import 'screens/withdraw/withdraw_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => HomeScreen(),
  register.routeName: (context) => register(),
  Login.routeName: (context) => Login(),
  ForgotPassword.routeName: (context) => ForgotPassword(),
  OtpScreen.routeName: (context) => OtpScreen(),
  UserDashbord.routeName: (context) => UserDashbord(),
  Statistics.routeName: (context) => Statistics(),
  Referrals.routeName: (context) => Referrals(),
  Withdraw.routeName: (context) => Withdraw(),
  Account.routeName: (context) => Account(),
  PricesScreen.routeName: (context) => PricesScreen(),
  ContactUsScreen.routeName: (context) => ContactUsScreen(),
  FAQ.routeName: (context) => FAQ(),
  BlogScreen.routeName: (context) => BlogScreen(),
  RestePasswordScreen.routeName: (context) => RestePasswordScreen(),
  Term.routeName: (context) => Term(),
};
