import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mining_sett/constants.dart';
import 'package:mining_sett/localization/language/languages.dart';

class WhatIscoinSection extends StatelessWidget {
  const WhatIscoinSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: hoverColor,
      width: MediaQuery.of(context).size.width,
      child: Container(
        width: MediaQuery.of(context).size.width - 200,
        // height: 700,

        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width / 3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/cloudmining1.png'),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  // color: Colors.amber,
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Text(
                        Languages.of(context)!.whatIsTitle1,
                        style: GoogleFonts.lato(
                            textStyle:
                                TextStyle(fontSize: 25, color: Colors.black),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 50),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0, left: 10),
                        child: Text(
                          Languages.of(context)!.whatIsDes1,
                          style: GoogleFonts.lato(
                              textStyle:
                                  TextStyle(fontSize: 18, color: Colors.black)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  // color: Colors.amber,
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Text(
                        Languages.of(context)!.whatIsTitle2,
                        style: GoogleFonts.lato(
                            textStyle:
                                TextStyle(fontSize: 25, color: Colors.black),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 50),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0, left: 10),
                        child: Text(
                          Languages.of(context)!.whatIsDes2,
                          style: GoogleFonts.lato(
                              textStyle:
                                  TextStyle(fontSize: 18, color: Colors.black)),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width / 3,
                  // color: Colors.pink,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/Ethereum.png'),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width / 3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/cloudmining1.png'),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  // color: Colors.amber,
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Text(
                        Languages.of(context)!.whatIsTitle3,
                        style: GoogleFonts.lato(
                            textStyle:
                                TextStyle(fontSize: 25, color: Colors.black),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 50),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0, left: 10),
                        child: Text(
                          Languages.of(context)!.whatIsDes3,
                          style: GoogleFonts.lato(
                              textStyle:
                                  TextStyle(fontSize: 18, color: Colors.black)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
