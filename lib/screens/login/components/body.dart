import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mining_sett/screens/home/components/theme_helper.dart';
import 'package:mining_sett/screens/register/register.dart';
import 'package:mining_sett/widgets/header_widget.dart';
import '/components/custom_shape.dart';
import '/components/no_account_text.dart';
import '/components/validator.dart';
import '/constants.dart';
import '/domain/user.dart';
import '/localization/language/languages.dart';
import '/screens/forgot_password/forgot_password_screen.dart';
import '/screens/home/components/footer_scetion_Mobile.dart';
import '/screens/home/components/footer_scetion_web.dart';
import '/screens/user_dashbord/user_dashord_screen.dart';
import '/utils/auth_provider.dart';
import '/utils/shared_preference.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import '/screens/login/components/textformfield.dart';
import '../../../AppResponsive.dart';
import '../../../responsive_ui.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

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

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final formKey = GlobalKey<FormState>();

  double _headerHeight = 150;

  // Key _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = AuthProvider();
    FocusNode _node1 = FocusNode();
// ignore: prefer_function_declarations_over_variables
    var doLogin = () async {
      String pass = md5
          .convert(utf8.encode(passwordController.text))
          .toString()
          .toLowerCase();

      if (Validator().validatePasswordLength(pass) == null &&
          Validator().validateEmail(emailController.text) == '') {
        auth.login(emailController.text).then((value) {
          if (value['state'] == true) {
            if (value['data']['Password'] != pass) {
              showTopSnackBar(
                context,
                CustomSnackBar.error(
                  message:
                      "We are sorry the password is wrong, Please check and try again",
                ),
              );
            } else {
              UserPreferences().saveRegesterdUser(true, emailController.text);
              UserPreferences().saveforgotUser(emailController.text);
              showTopSnackBar(
                context,
                CustomSnackBar.success(
                  message: "Good job. Wellcome Back",
                ),
              );
              Navigator.pushNamed(context, UserDashbord.routeName);
              UserPreferences().saveUser(User.fromJson(value['data']));
            }
          }
          if (value['state'] == false) {
            showTopSnackBar(
              context,
              CustomSnackBar.error(
                message:
                    "Something went wrong in your email or password.\n Please check and try again",
              ),
            );
          }
        });
      } else {
        showTopSnackBar(
          context,
          CustomSnackBar.error(
            message:
                "Something went wrong in your email or password.\n Please check and try again",
          ),
        );
      }
    };

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
      body: Container(
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: _headerHeight,
                child: HeaderWidget(_headerHeight, true,
                    Icons.login_rounded), //let's create a common header widget
              ),
              SafeArea(
                child: Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    margin: EdgeInsets.fromLTRB(
                        20, 10, 20, 10), // This will be the login form
                    child: Column(
                      children: [
                        Text(
                          Languages.of(context)!.login,
                          style: TextStyle(
                              fontSize: 60, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          Languages.of(context)!.logindes,
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 30.0),
                        Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Container(
                                  child: TextFormField(
                                    autofillHints: [AutofillHints.email],
                                    keyboardType: TextInputType.emailAddress,
                                    autofocus: true,
                                    textInputAction: TextInputAction.next,
                                    controller: emailController,
                                    decoration: ThemeHelper()
                                        .textInputDecoration(
                                            Languages.of(context)!.email,
                                            Languages.of(context)!.email),
                                    validator: (val) {
                                      if ((val!.isEmpty) ||
                                          !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                              .hasMatch(val)) {
                                        return "Enter a valid email address";
                                      }
                                      return null;
                                    },
                                  ),
                                  decoration:
                                      ThemeHelper().inputBoxDecorationShaddow(),
                                ),
                                SizedBox(height: 30.0),
                                Container(
                                  child: TextFormField(
                                    autofillHints: [AutofillHints.password],
                                    textInputAction: TextInputAction.next,
                                    controller: passwordController,
                                    obscureText: true,
                                    decoration: ThemeHelper()
                                        .textInputDecoration(
                                            Languages.of(context)!.password,
                                            Languages.of(context)!.password),
                                  ),
                                  decoration:
                                      ThemeHelper().inputBoxDecorationShaddow(),
                                ),
                                SizedBox(height: 15.0),
                                Container(
                                  margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
                                  alignment: Alignment.topRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, ForgotPassword.routeName);
                                    },
                                    child: Text(
                                      Languages.of(context)!.forgotpassword,
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
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
                                            .signin
                                            .toUpperCase(),
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                    onPressed: () {
                                      doLogin();
                                    },
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                                  //child: Text('Don\'t have an account? Create'),
                                  child: Text.rich(TextSpan(children: [
                                    TextSpan(
                                        text: Languages.of(context)!.donthave +
                                            " ?"),
                                    TextSpan(
                                      text: "  " +
                                          Languages.of(context)!.register,
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.pushNamed(
                                              context, register.routeName);
                                        },
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).accentColor),
                                    ),
                                  ])),
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
