import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mining_sett/localization/language/languages.dart';
import 'package:mining_sett/screens/blog/components/body.dart';
import 'package:mining_sett/screens/home/components/footer_scetion_Mobile.dart';
import 'package:mining_sett/screens/home/components/footer_scetion_web.dart';
import 'package:mining_sett/utils/auth_provider.dart';
import '../../AppResponsive.dart';
import '../../constants.dart';
import '/components/home_app_bar.dart';
import '/components/side_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);
  static String routeName = "/Cuntant Us";

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      endDrawer: screenwidth > 950 ? null : SideBar(),
      appBar: HomeAppBar(),
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                    // color: Colors.white,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade700,
                            spreadRadius: 2,
                            blurRadius: 9,
                            offset: Offset(-2, 3) // changes position of shadow
                            ),
                      ],
                    ),
                    child: (AppResponsive.isMobile(context)) ? Mobile() : Web())
              ],
            ),
          ),
          SizedBox(height: 30),
          MediaQuery.of(context).size.width < 900
              ? FooterScetionMobile()
              : FooterScetionWeb()
        ],
      ),
    );
  }
}

class Web extends StatelessWidget {
  const Web({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(10),
              color: kPrimaryColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Languages.of(context)!.whoweare,
                    style: GoogleFonts.quicksand(
                        textStyle: TextStyle(fontSize: 25, color: Colors.white),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    Languages.of(context)!.whoweanser,
                    style: GoogleFonts.quicksand(
                        textStyle: TextStyle(fontSize: 18, color: Colors.white),
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    Languages.of(context)!.doyouhave,
                    style: GoogleFonts.quicksand(
                        textStyle: TextStyle(fontSize: 25, color: Colors.white),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    Languages.of(context)!.doyouhaveanser,
                    style: GoogleFonts.quicksand(
                        textStyle: TextStyle(fontSize: 18, color: Colors.white),
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            )),
        Expanded(
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(LineIcons.searchLocation),
                    Text(
                      "SHAMINING",
                      style: GoogleFonts.quicksand(
                          textStyle:
                              TextStyle(fontSize: 25, color: Colors.black),
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "85 Gresham St \n London \n EC2R 7HE \n United Kingdom",
                  style: GoogleFonts.quicksand(
                      textStyle: TextStyle(fontSize: 18, color: Colors.black),
                      fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: 20,
                ),
                // launch('mailto:rajatrrpalankar@gmail.com
                // SelectableText(
                //   "info@miningset.com",
                //   style: GoogleFonts.quicksand(
                //       textStyle: TextStyle(fontSize: 18, color: Colors.black),
                //       fontWeight: FontWeight.normal),
                // )

                FutureBuilder(
                  future: auth.get_setting(),
                  builder: (context, dynamic snapshot) {
                    if (snapshot.data == null) {
                      return Text(' ');
                    } else {
                      String email = snapshot.data['data'][0]['Email'];
                      return GestureDetector(
                        onTap: () {
                          launch('mailto:$email');
                        },
                        child: Text(
                          email,
                          style: GoogleFonts.quicksand(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Mobile extends StatelessWidget {
  const Mobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          color: kPrimaryColor,
          child: Column(
            children: [
              Text(
                Languages.of(context)!.whoweare,
                style: GoogleFonts.quicksand(
                    textStyle: TextStyle(fontSize: 22, color: Colors.white),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                Languages.of(context)!.whoweanser,
                style: GoogleFonts.quicksand(
                    textStyle: TextStyle(fontSize: 18, color: Colors.white),
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                Languages.of(context)!.doyouhave,
                style: GoogleFonts.quicksand(
                    textStyle: TextStyle(fontSize: 22, color: Colors.white),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                Languages.of(context)!.doyouhaveanser,
                style: GoogleFonts.quicksand(
                    textStyle: TextStyle(fontSize: 18, color: Colors.white),
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
        Container(
          color: Colors.white,
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(LineIcons.searchLocation),
                  Text(
                    "SHAMINING",
                    style: GoogleFonts.quicksand(
                        textStyle: TextStyle(fontSize: 22, color: Colors.black),
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "85 Gresham St \n London \n EC2R 7HE \n United Kingdom",
                style: GoogleFonts.quicksand(
                    textStyle: TextStyle(fontSize: 18, color: Colors.black),
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 20,
              ),
              FutureBuilder(
                future: auth.get_setting(),
                builder: (context, dynamic snapshot) {
                  if (snapshot.data == null) {
                    return Text(' ');
                  } else {
                    String email = snapshot.data['data'][0]['Email'];
                    return GestureDetector(
                      onTap: () {
                        launch('mailto:$email');
                      },
                      child: Text(
                        email,
                        style: GoogleFonts.quicksand(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
