import 'package:flutter/material.dart';
import 'package:mining_sett/components/custom_shape.dart';
import 'package:mining_sett/components/no_account_text.dart';
import 'package:mining_sett/components/validator.dart';
import 'package:mining_sett/constants.dart';
import 'package:mining_sett/localization/language/languages.dart';
import 'package:mining_sett/screens/home/components/footer_scetion_Mobile.dart';
import 'package:mining_sett/screens/home/components/footer_scetion_web.dart';
import 'package:mining_sett/screens/home/components/theme_helper.dart';
import 'package:mining_sett/screens/otp/otp_screen.dart';
import 'package:mining_sett/utils/auth_provider.dart';
import 'package:mining_sett/utils/shared_preference.dart';
import 'package:mining_sett/widgets/header_widget.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:mining_sett/screens/login/components/textformfield.dart';
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

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  // GlobalKey<FormState> _key = GlobalKey();
  double _headerHeight = 150;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    UserPreferences().savetypeurl('/recovery');
    AuthProvider auth = AuthProvider();
    FocusNode _node1 = FocusNode();
// ignore: prefer_function_declarations_over_variables
    var doLogin = () {
      if (Validator().validateEmail(emailController.text) == "") {
        String email = emailController.text;
        auth.fogotfirststep(email).then((res) {
          if (res == true) {
            UserPreferences().saveemailUser(email);
            Navigator.pushNamed(context, OtpScreen.routeName);
          } else {
            showTopSnackBar(
              context,
              CustomSnackBar.error(
                message:
                    "We Are Sorry, But something is wrong. Please check to try again",
              ),
            );
          }
        });
      } else {
        showTopSnackBar(
          context,
          CustomSnackBar.info(
            message:
                "We Are Sorry, But something is wrong. Please check to try again",
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
                          .security_outlined) //let's create a common header widget
                  ),
              SafeArea(
                child: Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    margin: EdgeInsets.fromLTRB(
                        20, 10, 20, 10), // This will be the login form
                    child: Column(
                      children: [
                        Text(
                          Languages.of(context)!.forgotpasswordtitle,
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          Languages.of(context)!.forgotpassworddes,
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
                                    controller: emailController,
                                    decoration: ThemeHelper()
                                        .textInputDecoration(
                                            Languages.of(context)!.email,
                                            Languages.of(context)!.email),
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
