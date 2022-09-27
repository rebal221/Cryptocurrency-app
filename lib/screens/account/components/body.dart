import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mining_sett/AppResponsive.dart';
import 'package:mining_sett/components/defult_buy_button.dart';
import 'package:mining_sett/components/primary_user_menu.dart';
import 'package:mining_sett/components/validator.dart';
import 'package:mining_sett/constants.dart';
import 'package:mining_sett/localization/language/languages.dart';
import 'package:mining_sett/screens/account/account_screen.dart';
import 'package:mining_sett/screens/blog/components/body.dart';
import 'package:mining_sett/screens/otp/otp_screen.dart';
import 'package:mining_sett/utils/shared_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.screenwidth,
    required this.screenheight,
  }) : super(key: key);

  final double screenwidth;
  final double screenheight;

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    TextEditingController repassController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();

    return Container(
      child: Row(
        children: [
          if (AppResponsive.isWeb(context)) ...{
            PrimaryUserMenu(
                screenwidth: screenwidth, screenheight: screenheight),
          },
          Container(
            width: screenwidth < 950 ? screenwidth : screenwidth - 300,
            child: SingleChildScrollView(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                SizedBox(height: 60),
                Text(Languages.of(context)!.indentityver,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(fontSize: 40)),
                SizedBox(height: 40),
                Container(
                  width:
                      screenwidth < 950 ? screenwidth - 50 : screenwidth / 1.7,
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
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: FutureBuilder(
                      future: auth.accountState(),
                      builder: (context, snapshot) {
                        if (snapshot.data == false) {
                          return Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.red.shade200,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: 20),
                                Container(
                                    width: screenwidth < 950
                                        ? screenwidth / 5
                                        : 100,
                                    height: screenwidth < 950
                                        ? screenwidth / 5
                                        : 100,
                                    child:
                                        Image.asset('assets/icons/Close.png')),
                                SizedBox(height: 10),
                                Text(Languages.of(context)!.yourIndetityfalse,
                                    style: GoogleFonts.lato(
                                        fontSize: 20, color: Colors.red)),
                                SizedBox(height: 10),
                                Container(
                                  width:
                                      screenwidth < 950 ? 200 : screenwidth / 5,
                                  child: DefultbuttonBuy(
                                      title:
                                          Languages.of(context)!.verification,
                                      press: () async {
                                        final SharedPreferences prefs =
                                            await SharedPreferences
                                                .getInstance();
                                        String email = prefs
                                            .getString('email3')
                                            .toString();
                                        prefs.setString('email2', email);
                                        auth.fogotfirststep(email).then((res) {
                                          if (res == true) {
                                            UserPreferences()
                                                .savetypeurl('/account');
                                            Navigator.pushNamed(
                                                context, OtpScreen.routeName);
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
                                      }),
                                ),
                                SizedBox(height: 30),
                              ],
                            ),
                          );
                        } else {
                          return Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(15, 148, 67, 0.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: 20),
                                Container(
                                    width: screenwidth < 950
                                        ? screenwidth / 5
                                        : 100,
                                    height: screenwidth < 950
                                        ? screenwidth / 5
                                        : 100,
                                    child: Image.asset('assets/icons/ok.png')),
                                SizedBox(height: 10),
                                Text(Languages.of(context)!.yourIndetity,
                                    style: GoogleFonts.lato(
                                        fontSize: 20, color: kPrimaryColor)),
                                SizedBox(height: 30),
                              ],
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(height: 60),
                Text(Languages.of(context)!.account,
                    style: GoogleFonts.lato(fontSize: 40)),
                SizedBox(height: 60),
                Container(
                  width:
                      screenwidth < 950 ? screenwidth - 50 : screenwidth / 1.7,
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
                      borderRadius: BorderRadius.circular(10)),
                  child: FutureBuilder(
                    future: auth.get_AccountUser(),
                    builder: (context, dynamic snapshot) {
                      if (snapshot.data == null) {
                        return Container(
                          height: MediaQuery.of(context).size.height / 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/loading.gif",
                              ),
                            ],
                          ),
                        );
                      } else {
                        emailController.text = snapshot.data['data']['Email'];
                        nameController.text = snapshot.data['data']['Name'];
                        phoneController.text = snapshot.data['data']['Phone'];
                        return Column(
                          children: [
                            SizedBox(height: 50),
                            Text(Languages.of(context)!.email,
                                style: GoogleFonts.lato(fontSize: 20)),
                            SizedBox(height: 10),
                            Container(
                              width: 300,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.green.shade200),
                              child: TextFormField(
                                  controller: emailController,
                                  textAlign: TextAlign.center,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                  )),
                            ),
                            SizedBox(height: 20),
                            Text(Languages.of(context)!.name,
                                style: GoogleFonts.lato(fontSize: 20)),
                            SizedBox(height: 10),
                            Container(
                              width: 300,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.green.shade200),
                              child: TextFormField(
                                  controller: nameController,
                                  textAlign: TextAlign.center,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                  )),
                            ),
                            SizedBox(height: 20),
                            Text(Languages.of(context)!.phone,
                                style: GoogleFonts.lato(fontSize: 20)),
                            SizedBox(height: 10),
                            Container(
                              width: 300,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.green.shade200),
                              child: TextFormField(
                                  controller: phoneController,
                                  textAlign: TextAlign.center,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                  )),
                            ),
                            SizedBox(height: 30),
                            Container(
                                width: screenwidth < 950
                                    ? screenwidth / 2
                                    : screenwidth / 5,
                                child: DefultbuttonBuy(
                                  title: Languages.of(context)!.updateAccount,
                                  press: () {
                                    if (Validator().validateEmail(
                                                emailController.text) ==
                                            "" &&
                                        Validator().validateName(
                                                nameController.text) ==
                                            null &&
                                        Validator().validateMobile(
                                                phoneController.text) ==
                                            null) {
                                      auth.updateAccount(
                                          emailController.text,
                                          nameController.text,
                                          phoneController.text);
                                      showTopSnackBar(
                                        context,
                                        CustomSnackBar.success(
                                          message:
                                              "Good job, your account information has been modified successfully",
                                        ),
                                      );
                                      Navigator.pushNamed(
                                          context, Account.routeName);
                                    } else {
                                      showTopSnackBar(
                                        context,
                                        CustomSnackBar.error(
                                          message:
                                              "Something went wrong. Please check and try again",
                                        ),
                                      );
                                    }
                                  },
                                )),
                            SizedBox(height: 20),
                          ],
                        );
                      }
                    },
                  ),
                ),
                SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(Languages.of(context)!.updatepassword,
                        style: GoogleFonts.lato(fontSize: 30)),
                  ],
                ),
                SizedBox(height: 60),
                Container(
                  width:
                      screenwidth < 950 ? screenwidth - 50 : screenwidth / 1.7,
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
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      SizedBox(height: 50),
                      Text(Languages.of(context)!.password,
                          style: GoogleFonts.lato(fontSize: 20)),
                      SizedBox(height: 10),
                      Container(
                        width: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green.shade200),
                        child: TextFormField(
                            controller: passController,
                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(
                                border: InputBorder.none)),
                      ),
                      SizedBox(height: 20),
                      Text(Languages.of(context)!.repass,
                          style: GoogleFonts.lato(fontSize: 20)),
                      SizedBox(height: 10),
                      Container(
                        width: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green.shade200),
                        child: TextFormField(
                            controller: repassController,
                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(
                                border: InputBorder.none)),
                      ),
                      SizedBox(height: 30),
                      Container(
                          width: screenwidth < 950
                              ? screenwidth / 1.3
                              : screenwidth / 5,
                          child: DefultbuttonBuy(
                            title: Languages.of(context)!.updatepassword,
                            press: () {
                              if (passController.text ==
                                  repassController.text) {
                                if (Validator().validatePasswordLength(
                                        passController.text) ==
                                    null) {
                                  auth
                                      .restepassword(emailController.text,
                                          passController.text)
                                      .then((res) {
                                    if (res == true) {
                                      showTopSnackBar(
                                        context,
                                        CustomSnackBar.success(
                                          message:
                                              "Good job, Password has been changed. Wellcome",
                                        ),
                                      );
                                      Navigator.pushNamed(
                                          context, Account.routeName);
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
                                } else {}
                              } else {
                                showTopSnackBar(
                                  context,
                                  CustomSnackBar.error(
                                    message:
                                        "Something went wrong. Please check and try again",
                                  ),
                                );
                              }
                            },
                          )),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
                SizedBox(height: 50),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
