import 'package:flutter/material.dart';
import 'package:mining_sett/components/custom_shape.dart';
import 'package:mining_sett/constants.dart';
import 'package:mining_sett/domain/user.dart';
import 'package:mining_sett/localization/language/languages.dart';
import 'package:mining_sett/screens/account/account_screen.dart';
import 'package:mining_sett/screens/home/components/footer_scetion_Mobile.dart';
import 'package:mining_sett/screens/home/components/footer_scetion_web.dart';
import 'package:mining_sett/screens/home/components/theme_helper.dart';
import 'package:mining_sett/screens/otp/components/textformfield.dart';
import 'package:mining_sett/screens/reste_password/reste_password_screen.dart';
import 'package:mining_sett/screens/user_dashbord/user_dashord_screen.dart';
import 'package:mining_sett/utils/auth_provider.dart';
import 'package:mining_sett/utils/shared_preference.dart';
import 'package:mining_sett/widgets/header_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import '../../../AppResponsive.dart';
import '../../../responsive_ui.dart';

class Body extends StatefulWidget {
  Body({
    Key? key,
    required this.screenwidth,
    required this.screenheight,
    required this.context,
  }) : super(key: key);

  final double screenwidth;
  final double screenheight;
  final BuildContext context;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late double _height;

  late double _width;

  late double _pixelRatio;

  late bool _large;

  late bool _medium;

  TextEditingController v1 = TextEditingController();

  TextEditingController v2 = TextEditingController();

  TextEditingController v3 = TextEditingController();

  TextEditingController v4 = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  double _headerHeight = 150;

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = AuthProvider();

// ignore: prefer_function_declarations_over_variables
    dovalidate() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String email = "";
      String code = "";
      email = prefs.getString("email2")!;
      //;
      code = v1.text;

      auth.emailValidation2(email, code).then((res) {
        if (res == null) {
          showTopSnackBar(
            context,
            CustomSnackBar.info(
              message:
                  "We Are Sorry, But something is wrong. Please check to try again",
            ),
          );
        }
        if (res == true) {
          UserPreferences().gettypeurl().then((value) {
            if (value == '/register') {
              Navigator.pushNamed(context, UserDashbord.routeName);
              UserPreferences().saveforgotUser(email);
              auth.getUser(email).then((value) {
                UserPreferences().saveUser(User.fromJson(value['data']));
              });
            }
            if (value == '/recovery') {
              Navigator.pushNamed(context, RestePasswordScreen.routeName);
            }
            if (value == '/account') {
              Navigator.pushNamed(context, Account.routeName);
            }
            if (value == '/Active') {
              Navigator.pushNamed(context, Account.routeName);
            }
          });
          showTopSnackBar(
            context,
            CustomSnackBar.success(
              message: "Good job, Verified successfully. Wellcome",
            ),
          );
        }
        if (res == false) {
          showTopSnackBar(
            context,
            CustomSnackBar.error(
              message:
                  "We Are Sorry, But the code you entered is wrong. Please try again",
            ),
          );
        }
      });
    }

    if (AppResponsive.isMobile(context)) {
      _height = MediaQuery.of(context).size.height;
      _width = MediaQuery.of(context).size.width;
    } else {
      _height = MediaQuery.of(context).size.height - 200;
      _width = MediaQuery.of(context).size.width / 3;
    }
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width > 900
              ? MediaQuery.of(context).size.width / 2
              : MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade400,
                  spreadRadius: 2,
                  blurRadius: 9,
                  offset: Offset(-2, 3) // changes position of shadow
                  ),
            ],
          ),
          child: Column(
            children: [
              Container(
                  height: _headerHeight,
                  child: HeaderWidget(
                      _headerHeight,
                      true,
                      Icons
                          .password_outlined) //let's create a common header widget
                  ),
              SafeArea(
                child: Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    margin: EdgeInsets.fromLTRB(
                        20, 10, 20, 10), // This will be the login form
                    child: Column(
                      children: [
                        Text(
                          Languages.of(context)!.codever,
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          Languages.of(context)!.codehasbeen,
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 30.0),
                        Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Container(
                                  child: TextFormField(
                                    autofocus: true,
                                    textInputAction: TextInputAction.next,
                                    controller: v1,
                                    decoration: ThemeHelper()
                                        .textInputDecoration("* * * *", "Code"),
                                  ),
                                  decoration:
                                      ThemeHelper().inputBoxDecorationShaddow(),
                                ),
                                SizedBox(height: 30.0),
                                Container(
                                  decoration: ThemeHelper()
                                      .buttonBoxDecoration(context),
                                  child: ElevatedButton(
                                    style: ThemeHelper().buttonStyle(),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(40, 10, 40, 10),
                                      child: Text(
                                        Languages.of(context)!
                                            .submit
                                            .toUpperCase(),
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                    onPressed: () {
                                      dovalidate();
                                    },
                                  ),
                                ),
                              ],
                            )),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
