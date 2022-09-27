import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../screens/home/home_screen.dart';

import '../constants.dart';
import 'custom_menu.dart';
import 'custom_user_buttons.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(80);
  const HomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return screenwidth > 950
        ? CustomHomeWebAppBar(screenwidth: screenwidth)
        : CustomHomeMobileAppBar(
            screenwidth: screenwidth,
          );
  }
}

class CustomHomeWebAppBar extends StatelessWidget {
  const CustomHomeWebAppBar({
    Key? key,
    required this.screenwidth,
  }) : super(key: key);

  final double screenwidth;
  static String token = "";

  @override
  Widget build(BuildContext context) {
    // AuthProvider auth = Provider.of<AuthProvider>(context);

// ignore: prefer_function_declarations_over_variables

    return AppBar(
      automaticallyImplyLeading: false,
      shadowColor: Colors.grey,
      toolbarHeight: 80,
      actions: [
        Container(
          width: screenwidth,
          child: Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: 120,
                    height: 80,
                    child: screenwidth < 900
                        ? LogoMobile()
                        : MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: LogoWeb())),
                CustomMenu(),
                UserButtons(),
              ],
            ),
          ),
        ),

        // centerTitle: true,
      ],
      flexibleSpace: Container(
        color: kPrimaryColor,
      ),
    );
  }
}

class LogoWeb extends StatelessWidget {
  const LogoWeb({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, HomeScreen.routeName);
      },
      child: SvgPicture.asset(
        'assets/images/Logo.svg',
        // color: Colors.white,
      ),
    );
  }
}

class LogoMobile extends StatelessWidget {
  const LogoMobile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, HomeScreen.routeName);
      },
      child: SvgPicture.asset(
        'assets/images/Logo.svg',
        // color: Colors.white,
      ),
    );
  }
}

class CustomHomeMobileAppBar extends StatelessWidget {
  const CustomHomeMobileAppBar({
    Key? key,
    required this.screenwidth,
  }) : super(key: key);

  final double screenwidth;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // leading: screenwidth < 950
      //     ? IconButton(
      //         icon: Icon(Icons.arrow_back),
      //         onPressed: () {
      //           Navigator.pop(context);
      //         },
      //       )
      //     : null,
      toolbarHeight: 80,
      title: Container(
          width: 120,
          height: 80,
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, HomeScreen.routeName);
            },
            child: SvgPicture.asset(
              'assets/images/Logo.svg',
              // color: Colors.white,
            ),
          )),
      centerTitle: screenwidth < 950 ? false : true,
      shadowColor: Colors.grey,
      flexibleSpace: Container(
        color: kPrimaryColor,
      ),
    );
  }
}
