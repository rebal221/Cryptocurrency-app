import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mining_sett/localization/language/languages.dart';
import 'package:mining_sett/screens/login/login.dart';
import 'package:mining_sett/screens/register/register.dart';
import 'package:mining_sett/screens/user_dashbord/user_dashord_screen.dart';
import 'package:mining_sett/utils/shared_preference.dart';
import '../constants.dart';

class UserButtons extends StatefulWidget {
  const UserButtons({
    Key? key,
  }) : super(key: key);

  @override
  State<UserButtons> createState() => _UserButtonsState();
}

class _UserButtonsState extends State<UserButtons> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                        offset:
                            const Offset(-2, 3) // changes position of shadow
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
                                      fontSize: 18, color: Colors.white)),
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
                    Navigator.pushNamed(context, UserDashbord.routeName);
                  },
                ),
              );
            }
          },
        ));
  }
}

class RejesterButton extends StatelessWidget {
  const RejesterButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade700,
              spreadRadius: 2,
              blurRadius: 9,
              offset: const Offset(-2, 3) // changes position of shadow
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
            const Icon(LineIcons.userCircle),
            Text(Languages.of(context)!.register,
                style:
                    GoogleFonts.lato(textStyle: const TextStyle(fontSize: 15))),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        onPressed: () {
          Navigator.pushNamed(context, register.routeName);
        },
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.white,
          width: 1, //                   <--- border width here
        ),
      ),
      // ignore: deprecated_member_use
      child: FlatButton(
        splashColor: Colors.amber,
        color: kPrimaryColor,
        textColor: Colors.white,
        child: Row(
          // Replace with a Row for horizontal icon + text
          children: <Widget>[
            const Icon(LineIcons.userCircle),
            Text(Languages.of(context)!.login,
                style:
                    GoogleFonts.lato(textStyle: const TextStyle(fontSize: 15))),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        onPressed: () {
          Navigator.pushNamed(context, Login.routeName);
        },
      ),
    );
  }
}
