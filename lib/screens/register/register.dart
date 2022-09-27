import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mining_sett/screens/home/components/theme_helper.dart';
import 'package:mining_sett/screens/login/login.dart';
import 'package:mining_sett/widgets/header_widget.dart';
import '/components/custom_shape.dart';
import '/components/home_app_bar.dart';
import '/components/side_bar.dart';
import '/localization/language/languages.dart';
import '/screens/home/components/footer_scetion_Mobile.dart';
import '/screens/login/components/textformfield.dart';
import '/screens/otp/otp_screen.dart';
import '/utils/auth_provider.dart';
import '/utils/shared_preference.dart';
import '/utils/validator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../AppResponsive.dart';
import '../../constants.dart';
import '../../responsive_ui.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

class register extends StatefulWidget {
  static String routeName = "/register";

  @override
  State<register> createState() => _LoginState();
}

class _LoginState extends State<register> {
  DateTime selectedDate = DateTime.now();
  final formKey = GlobalKey<FormState>();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: kPrimaryColor, // header background color
              onPrimary: Colors.white, // header text color
            ),
          ),
          child: child!,
        );
      },
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1950, 1),
      lastDate: DateTime(2040),
      helpText: "SELECT BOOKING DATE",
      fieldHintText: "DATE/MONTH/YEAR",
      fieldLabelText: "BOOKING DATE",
      errorFormatText: "Enter a Valid Date",
      errorInvalidText: "Date Out of Range",
    );

    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  late double _height;
  late double _width;
  late double _pixelRatio;
  late bool _large;
  late bool _medium;
  // double screenwidth = MediaQuery.of(context).size.width;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController reemailController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool cond = false;
  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    if (AppResponsive.isMobile(context)) {
      _height = MediaQuery.of(context).size.height;
      _width = MediaQuery.of(context).size.width;
    } else {
      _height = MediaQuery.of(context).size.height - 200;
      _width = MediaQuery.of(context).size.width / 1.2;
    }
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);

    return Scaffold(
      endDrawer: const SideBar(),
      appBar: HomeAppBar(),
      // backgroundColor: Colors.white,
      body: Center(child: material()),
    );
  }

  material() {
    AuthProvider auth = AuthProvider();
    FocusNode _node1 = FocusNode();
// ignore: prefer_function_declarations_over_variables
    var doregster = () async {
      String pass = md5
          .convert(utf8.encode(passwordController.text))
          .toString()
          .toLowerCase();
      if (Validator().validatePasswordLength(passwordController.text) == null &&
          Validator().validateEmail(emailController.text) == "" &&
          emailController.text == reemailController.text &&
          passwordController.text == repasswordController.text) {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        String? rootId = prefs.getString('id');
        auth.regster(emailController.text, pass, nameController.text,
            phoneController.text, rootId!);

        // WidgetsFlutterBinding.ensureInitialized();

        bool? status = false;
        status = prefs.getBool("regester");
        String? status2 = prefs.getString('email2');

        // print('ddddddddddddddddd' + status.toString());
        if (status == true) {
          var respose = auth.emailValidation(
            emailController.text,
          );
          UserPreferences().savetypeurl('/register');

          Navigator.pushNamed(context, OtpScreen.routeName);
        } else if (status2 == 'We are sorry email aredy exist') {
          showTopSnackBar(
            context,
            CustomSnackBar.info(
              message: "We are sorry email aredy exist",
            ),
          );
        } else {
          showTopSnackBar(
            context,
            CustomSnackBar.error(
              message:
                  "Something went wrong. Please check your credentials and try again",
            ),
          );
        }
      } else {
        showTopSnackBar(
          context,
          CustomSnackBar.info(
            message:
                "Something went wrong. Please check your credentials and try again",
          ),
        );
      }
    };
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
          child: Stack(
            children: [
              Container(
                height: 150,
                child: HeaderWidget(150, false, Icons.person_add_alt_1_rounded),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(25, 50, 25, 10),
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          GestureDetector(
                            child: Stack(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                        width: 5, color: Colors.white),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 20,
                                        offset: const Offset(5, 5),
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.grey.shade300,
                                    size: 80.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 15.0),
                          FormField<bool>(
                            builder: (state) {
                              return Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Checkbox(
                                          value: checkboxValue,
                                          onChanged: (value) {
                                            setState(() {
                                              checkboxValue = value!;
                                              state.didChange(value);
                                            });
                                          }),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.5,
                                        child: Text(
                                          Languages.of(context)!.byregester,
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 13),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      state.errorText ?? '',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Theme.of(context).errorColor,
                                        fontSize: 12,
                                      ),
                                    ),
                                  )
                                ],
                              );
                            },
                            validator: (value) {
                              if (!checkboxValue) {
                                return 'You need to accept terms and conditions';
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(height: 20.0),
                          Container(
                            child: TextFormField(
                              textInputAction: TextInputAction.next,
                              controller: emailController,
                              decoration: ThemeHelper().textInputDecoration(
                                  Languages.of(context)!.email + " *",
                                  Languages.of(context)!.email),
                              keyboardType: TextInputType.emailAddress,
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
                              textInputAction: TextInputAction.next,
                              controller: reemailController,
                              decoration: ThemeHelper().textInputDecoration(
                                  Languages.of(context)!.reemail + " *",
                                  Languages.of(context)!.reemail),
                              keyboardType: TextInputType.emailAddress,
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
                              textInputAction: TextInputAction.next,
                              controller: passwordController,
                              obscureText: true,
                              decoration: ThemeHelper().textInputDecoration(
                                  Languages.of(context)!.password + " *",
                                  Languages.of(context)!.password),
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Please enter your password";
                                }
                                return null;
                              },
                            ),
                            decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            child: TextFormField(
                              textInputAction: TextInputAction.next,
                              controller: repasswordController,
                              obscureText: true,
                              decoration: ThemeHelper().textInputDecoration(
                                  Languages.of(context)!.repass + " *",
                                  Languages.of(context)!.repass),
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Please enter your password";
                                }
                                return null;
                              },
                            ),
                            decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            child: TextFormField(
                              textInputAction: TextInputAction.next,
                              controller: nameController,
                              decoration: ThemeHelper().textInputDecoration(
                                  Languages.of(context)!.name,
                                  Languages.of(context)!.name),
                            ),
                            decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            child: TextFormField(
                              textInputAction: TextInputAction.next,
                              controller: phoneController,
                              decoration: ThemeHelper().textInputDecoration(
                                  Languages.of(context)!.phone,
                                  Languages.of(context)!.phone),
                              keyboardType: TextInputType.phone,
                            ),
                            decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                          ),
                          SizedBox(height: 20.0),
                          Container(
                            decoration:
                                ThemeHelper().buttonBoxDecoration(context),
                            child: ElevatedButton(
                              style: ThemeHelper().buttonStyle(),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(40, 10, 40, 10),
                                child: Text(
                                  "Register".toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  doregster();
                                }
                              },
                            ),
                          ),
                          SizedBox(height: 30.0),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
