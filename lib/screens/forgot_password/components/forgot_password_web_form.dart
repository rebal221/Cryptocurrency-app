import 'package:flutter/material.dart';
import 'package:mining_sett/components/have_account.dart';
import 'package:mining_sett/constants.dart';
import 'package:mining_sett/screens/login/components/user_name_field.dart';
import 'package:mining_sett/screens/otp/otp_screen.dart';

Container ForgotpasswordWeb(BuildContext context, double screenwidth) {
  return Container(
    padding: EdgeInsets.only(left: 15, top: 25),
    child: Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Forgot Password',
          style: headingStyle,
        ),
        Text(
          'Please enter your email and we will send \nyou a link to return to your account',
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 40),
        UserNameField(),
        SizedBox(height: 25),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FlatButton(
              color: Colors.grey[200],
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
            SizedBox(
              width: 20.0,
            ),
            FlatButton(
              color: kPrimaryColor,
              onPressed: () {
                Navigator.pushNamed(context, OtpScreen.routeName);
              },
              child: Text(
                "Submit",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        SizedBox(height: 25),
        if (screenwidth < 1200) ...{
          AccountText(),
          SizedBox(height: 10),
        }
      ],
    ),
  );
}
