import 'package:flutter/material.dart';
import 'package:mining_sett/components/custom_shape.dart';
import 'package:mining_sett/components/validator.dart';
import 'package:mining_sett/constants.dart';
import 'package:mining_sett/domain/user.dart';
import 'package:mining_sett/localization/language/languages.dart';
import 'package:mining_sett/screens/home/components/footer_scetion_Mobile.dart';
import 'package:mining_sett/screens/home/components/footer_scetion_web.dart';
import 'package:mining_sett/screens/home/components/theme_helper.dart';
import 'package:mining_sett/screens/user_dashbord/user_dashord_screen.dart';
import 'package:mining_sett/utils/auth_provider.dart';
import 'package:mining_sett/utils/shared_preference.dart';
import 'package:mining_sett/widgets/header_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:mining_sett/screens/login/components/textformfield.dart';
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
  TextEditingController passwordController = TextEditingController();

  TextEditingController repasswordController = TextEditingController();

  double _headerHeight = 150;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = AuthProvider();
    FocusNode _node1 = FocusNode();
// ignore: prefer_function_declarations_over_variables
    var doLogin = () async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      if (Validator().validatePasswordLength(passwordController.text) == null) {
        String email = prefs.getString('email2')!;
        String pass = md5
            .convert(utf8.encode(passwordController.text))
            .toString()
            .toLowerCase();
        if (passwordController.text == repasswordController.text) {
          auth.restepassword(email, pass).then((res) {
            if (res == true) {
              UserPreferences().saveRegesterdUser(true, email);
              auth.getUser(email).then((value) {
                UserPreferences().saveUser(User.fromJson(value['data']));
              });
              Navigator.pushNamed(context, UserDashbord.routeName);
              UserPreferences().saveforgotUser(email);
              showTopSnackBar(
                context,
                CustomSnackBar.success(
                  message: "Good job, Password has been changed. Wellcome",
                ),
              );
            }
            if (res == false) {
              showTopSnackBar(
                context,
                CustomSnackBar.error(
                  message:
                      "We Are Sorry, But something is wrong. Please try again",
                ),
              );
            }
          });
        } else {
          showTopSnackBar(
            context,
            CustomSnackBar.error(
              message: "We Are Sorry, Confirm Password Wrong",
            ),
          );
        }
      } else {
        showTopSnackBar(
          context,
          CustomSnackBar.error(
            message: "We Are Sorry, plaese enter new password",
          ),
        );
      }
    };
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
                        .home_repair_service_outlined), //let's create a common header widget
              ),
              SafeArea(
                child: Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    margin: EdgeInsets.fromLTRB(
                        20, 10, 20, 10), // This will be the login form
                    child: Column(
                      children: [
                        Text(
                          Languages.of(context)!.resetpass,
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          Languages.of(context)!.reseetpassdes,
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 30.0),
                        Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Container(
                                  child: TextFormField(
                                    controller: passwordController,
                                    decoration: ThemeHelper()
                                        .textInputDecoration(
                                            Languages.of(context)!.password,
                                            Languages.of(context)!.password),
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
                                  child: TextField(
                                    textInputAction: TextInputAction.next,
                                    controller: repasswordController,
                                    // obscureText: true,
                                    decoration: ThemeHelper()
                                        .textInputDecoration(
                                            Languages.of(context)!.repass,
                                            Languages.of(context)!.repass),
                                  ),
                                  decoration:
                                      ThemeHelper().inputBoxDecorationShaddow(),
                                ),
                                SizedBox(height: 15.0),
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
