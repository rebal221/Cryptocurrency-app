import 'package:flutter/material.dart';
import 'package:mining_sett/constants.dart';

class UserNameField extends StatelessWidget {
  const UserNameField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Row(
          children: <Widget>[
            Container(
              width: screenwidth > 900 ? screenwidth / 17 : screenwidth / 4,
              child: Text(
                "Username",
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Container(
              width: screenwidth > 900 ? screenwidth / 7 : screenwidth / 2,
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  fontSize: 15.0,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: hoverColor,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: kPrimaryColor,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  hintText: "Enter your email",
                  fillColor: hoverColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
