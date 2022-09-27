import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mining_sett/constants.dart';

class MobileAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(80);
  const MobileAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.white),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      toolbarHeight: 80,
      title: Container(
        width: 120,
        height: 80,
        child: SvgPicture.asset(
          'assets/images/Logo.svg',
          // color: Colors.white,
        ),
      ),
      centerTitle: true,
      shadowColor: Colors.grey,
      flexibleSpace: Container(
        color: kPrimaryColor,
      ),
    );
  }
}
