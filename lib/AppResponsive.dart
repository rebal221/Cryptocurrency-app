import 'package:flutter/material.dart';

class AppResponsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget web;
  const AppResponsive(
      {Key? key, required this.mobile, required this.tablet, required this.web})
      : super(key: key);

  static bool isMobile(context) => MediaQuery.of(context).size.width < 900;
  static bool isTablet(context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width > 900;
  static bool isWeb(context) => MediaQuery.of(context).size.width >= 1300;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    if (isWeb(context)) {
      return web;
    } else if (isTablet(context)) {
      return tablet;
    } else {
      return mobile;
    }
    return Container();
  }
}
