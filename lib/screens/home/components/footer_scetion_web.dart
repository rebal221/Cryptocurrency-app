import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mining_sett/components/custom_menu.dart';
import 'package:getwidget/getwidget.dart';
import 'package:mining_sett/localization/language/languages.dart';
import 'package:mining_sett/screens/FQS/faq_screen.dart';
import 'package:mining_sett/screens/blog/blog_screen.dart';
import 'package:mining_sett/screens/blog/components/body.dart';
import 'package:mining_sett/screens/contact_us/contact_us_sceen.dart';
import 'package:mining_sett/screens/prices/prices_screen.dart';
import 'package:mining_sett/screens/term/term_screen.dart';
import '../../../AppResponsive.dart';
import '../../../constants.dart';
import '../home_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterScetionWeb extends StatelessWidget {
  const FooterScetionWeb({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryColor,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.width / 10,
            width: MediaQuery.of(context).size.width / 7,
            child: SvgPicture.asset(
              'assets/images/Logo.svg',
              // color: Colors.white,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GFIconButton(
                    onPressed: () {
                      auth.get_setting().then((value) {
                        String _URL = value['data'][0]['Facebook'];
                        launch(_URL);
                      });
                    },
                    icon: Icon(LineIcons.facebook),
                    // size: GFSize.SMALL,
                    type: GFButtonType.outline,
                    shape: GFIconButtonShape.pills,
                    color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GFIconButton(
                    onPressed: () {
                      auth.get_setting().then((value) {
                        String _URL = value['data'][0]['Youtube'];
                        launch(_URL);
                      });
                    },
                    icon: Icon(LineIcons.youtube),
                    // size: GFSize.SMALL,
                    type: GFButtonType.outline,
                    shape: GFIconButtonShape.pills,
                    color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GFIconButton(
                    onPressed: () {
                      auth.get_setting().then((value) {
                        String _URL = value['data'][0]['Whatsapp'];
                        launch(_URL);
                      });
                    },
                    icon: Icon(LineIcons.whatSApp),
                    // size: GFSize.SMALL,
                    type: GFButtonType.outline,
                    shape: GFIconButtonShape.pills,
                    color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GFIconButton(
                    onPressed: () {
                      auth.get_setting().then((value) {
                        String _URL = value['data'][0]['Instagram'];
                        launch(_URL);
                      });
                    },
                    icon: Icon(LineIcons.instagram),
                    // size: GFSize.SMALL,
                    type: GFButtonType.outline,
                    shape: GFIconButtonShape.pills,
                    color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (AppResponsive.isMobile(context)) ...{
                pageTitleMobile(
                  title: Languages.of(context)!.titleHome,
                  press: () {
                    Navigator.pushNamed(context, HomeScreen.routeName);
                  },
                ),
                SizedBox(width: 15),
                pageTitleMobile(
                  title: Languages.of(context)!.titlePrices,
                  press: () {
                    Navigator.pushNamed(context, PricesScreen.routeName);
                  },
                ),
                SizedBox(width: 15),
                pageTitleMobile(
                  title: Languages.of(context)!.titleContactUs,
                  press: () {
                    Navigator.pushNamed(context, ContactUsScreen.routeName);
                  },
                ),
                SizedBox(width: 15),
                pageTitleMobile(
                  title: Languages.of(context)!.titleHowITWork,
                  press: () {
                    Navigator.pushNamed(context, FAQ.routeName);
                  },
                ),
                SizedBox(width: 15),
                pageTitleMobile(
                  title: Languages.of(context)!.titleBlog,
                  press: () {
                    Navigator.pushNamed(context, BlogScreen.routeName);
                  },
                ),
                SizedBox(width: 15),
                pageTitleMobile(
                  title: Languages.of(context)!.titleterm,
                  press: () {
                    Navigator.pushNamed(context, Term.routeName);
                  },
                ),
              },
              if (AppResponsive.isWeb(context)) ...{
                pageTitleWeb(
                  title: Languages.of(context)!.titleHome,
                  press: () {
                    Navigator.pushNamed(context, HomeScreen.routeName);
                  },
                ),
                SizedBox(width: 15),
                pageTitleWeb(
                  title: Languages.of(context)!.titlePrices,
                  press: () {
                    Navigator.pushNamed(context, PricesScreen.routeName);
                  },
                ),
                SizedBox(width: 15),
                pageTitleWeb(
                  title: Languages.of(context)!.titleContactUs,
                  press: () {
                    Navigator.pushNamed(context, ContactUsScreen.routeName);
                  },
                ),
                SizedBox(width: 15),
                pageTitleWeb(
                  title: Languages.of(context)!.titleHowITWork,
                  press: () {
                    Navigator.pushNamed(context, FAQ.routeName);
                  },
                ),
              },
            ],
          ),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (AppResponsive.isWeb(context)) ...{
                pageTitleWeb(
                  title: Languages.of(context)!.titleBlog,
                  press: () {
                    Navigator.pushNamed(context, BlogScreen.routeName);
                  },
                ),
                SizedBox(width: 15),
                pageTitleWeb(
                  title: Languages.of(context)!.titleterm,
                  press: () {
                    Navigator.pushNamed(context, Term.routeName);
                  },
                ),
              }
            ],
          ),
          SizedBox(height: 25),
          horizontalLine(MediaQuery.of(context).size.width - 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                child: Text(
                  '2021 © SHAMINING, All Rights Reserved',
                  style: GoogleFonts.quicksand(
                      textStyle: TextStyle(fontSize: 14, color: Colors.white)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
