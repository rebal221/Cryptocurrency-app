import 'package:flutter/material.dart';
import 'package:mining_sett/screens/login/login.dart';
import 'package:page_transition/page_transition.dart';

import '../constants.dart';

class AccountText extends StatelessWidget {
  const AccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Log in with your email and password",
        ),
        SizedBox(width: 5),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, Login.routeName);
          },
          child: Text(
            'Log in',
            style: TextStyle(color: kScoundrColor),
          ),
        ),
      ],
    );
  }
}
