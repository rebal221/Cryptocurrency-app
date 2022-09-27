import 'package:flutter/material.dart';
import 'package:mining_sett/localization/language/languages.dart';
import 'package:mining_sett/screens/forgot_password/forgot_password_screen.dart';
import 'package:mining_sett/screens/register/register.dart';
import 'package:page_transition/page_transition.dart';

import '../constants.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              Languages.of(context)!.donthave,
            ),
            SizedBox(width: 5),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, register.routeName);
              },
              child: Text(
                Languages.of(context)!.register,
                style: TextStyle(color: kScoundrColor),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
